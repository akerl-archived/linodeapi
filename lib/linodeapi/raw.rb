require 'httparty'

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
      @spec = params.fetch(:spec) { SPEC }
      @apikey = params.fetch(:apikey) { authenticate(params).first }
    end

    def respond_to?(method, include_private = false)
      super || @spec[:subs].include?(method)
    end

    def to_s
      'LinodeAPI::Raw object'
    end
    alias_method :inspect, :to_s

    private

    def authenticate(params = {})
      return [] unless @names.empty?
      unless (params.values_at :username, :password).all?
        fail ArgumentError, 'You must provide either an API key or user/pass'
      end
      user.getapikey(params).values_at :api_key
    end

    def method_missing(method, *args, &block)
      return super unless respond_to? method
      case @spec[:subs][method][:type]
      when :group then make_group method
      when :call then make_call method, *args
      end
    end

    def make_group(method)
      options = {
        spec: @spec[:subs][method],
        apikey: @apikey,
        username: @username,
        names: @names + [method]
      }
      instance_eval "def #{method}() @#{method} end"
      instance_variable_set "@#{method}".to_sym, Raw.new(options)
    end

    def make_call(method, *args)
      instance_eval "def #{method}(*args) call(:#{method}, *args) end"
      send(method, *args)
    end

    def call(method, params = {})
      spec = @spec[:subs][method]
      method = (@names + [method.to_s]).join '.'
      options = self.class.validate method, spec[:params], params
      options.merge! api_key: @apikey, api_action: method
      self.class.parse self.class.post('', body: options).parsed_response
    end

    def self.parse(resp)
      unless resp['ERRORARRAY'].empty?
        fail "API Error on #{resp['ACTION']}: #{resp['ERRORARRAY']}"
      end
      data = resp['DATA']
      data.is_a?(Hash) ? clean(data) : data.map { |x| clean x }
    end

    def self.clean(object)
      Hash[object.map { |k, v| [k.downcase.to_sym, v] }]
    end

    def self.validate(method, spec, given)
      spec.each_with_object({}) do |(param, info), options|
        if given.include? param
          options[param] = VALIDATION_METHODS[info[:type]].call given[param]
        else
          fail ArgumentError, "#{method} requires #{param}" if info[:required]
        end
      end
    end
  end

  private

  VALIDATION_METHODS = {
    boolean: proc { |e| e == true },
    numeric: proc { |e| Integer(e) },
    string: proc(&:to_s)
  }
end
