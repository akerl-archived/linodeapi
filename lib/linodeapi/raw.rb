require 'httparty'
require 'ostruct'

##
# Raw API wrapper, dynamically loaded from the published spec
module LinodeAPI
  ##
  # Raw API object
  class Raw
    include HTTParty

    attr_reader :apikey, :spec, :names

    def initialize(params = {})
      self.class.base_uri params.fetch(:endpoint, DEFAULT_ENDPOINT)
      @names = params.fetch(:names) { [] }
      @spec = params.fetch(:spec) { LinodeAPI.spec }
      @apikey = params.fetch(:apikey) { authenticate(params) }
    end

    def respond_to_missing?(method, include_private = false)
      @spec[:subs].include?(method) || super
    end

    def to_s
      'LinodeAPI::Raw object'
    end
    alias inspect to_s

    private

    def authenticate(params = {})
      return [] unless @names.empty?
      unless (params.values_at :username, :password).all?
        raise ArgumentError, 'You must provide either an API key or user/pass'
      end
      user.getapikey(params).api_key
    end

    def method_missing(method, *args, &block)
      return super unless respond_to? method
      case @spec[:subs][method][:type]
      when :group then make_group method
      when :call then make_call method, *args
      end
    end

    def make_group(method)
      group = Raw.new(
        spec: @spec[:subs][method],
        apikey: @apikey,
        username: @username,
        names: @names + [method]
      )
      name = "@#{method}".to_sym
      instance_variable_set name, group
      define_singleton_method(method) { instance_variable_get(name) }
      group
    end

    def make_call(method, *args)
      define_singleton_method(method) { |*a| call(method, *a) }
      send(method, *args)
    end

    def call(method, params = {})
      spec = @spec[:subs][method]
      method = (@names + [method.to_s]).join '.'
      options = self.class.validate method, spec[:params], params
      options[:api_key] = @apikey
      options[:api_action] = method
      error_check self.class.post('', body: options)
    end

    def error_check(resp)
      error = create_http_error(resp)
      raise(error) if error
      data = resp.parsed_response
      raise('Invalid API response received') if data.nil?
      self.class.parse data
    end

    def create_http_error(resp)
      code = resp.code
      return nil if code == 200
      delay = resp.headers['Retry-After']
      return RetryableHTTPError.new(code, delay) if delay
      HTTPError.new(code)
    end

    class << self
      def parse(resp)
        resp['ERRORARRAY'].reject! { |x| x['ERRORCODE'].zero? }
        raise(APIError, resp) unless resp['ERRORARRAY'].empty?
        data = resp['DATA']
        data.is_a?(Hash) ? clean(data) : data.map { |x| clean x }
      end

      def clean(object)
        OpenStruct.new(Hash[object.map { |k, v| [k.downcase.to_sym, v] }])
      end

      def validate(method, spec, given)
        spec.each_with_object({}) do |(param, info), options|
          if given.include? param
            options[param] = VALIDATION_METHODS[info[:type]].call given[param]
          elsif info[:required]
            raise ArgumentError, "#{method} requires #{param}"
          end
        end
      end
    end
  end

  VALIDATION_METHODS = {
    boolean: proc { |e| !!e }, # rubocop:disable Style/DoubleNegation
    numeric: proc { |e| Integer(e) },
    string: proc(&:to_s)
  }.freeze
end
