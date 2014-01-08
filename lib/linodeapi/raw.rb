require 'httparty'

##
# Raw API wrapper, dynamically loaded from the published spec

module LinodeAPI
  ##
  # Raw API object

  class Raw
    include HTTParty

    attr_reader :apikey

    def initialize(params = {})
      self.class.base_uri params.fetch(:endpoint, DEFAULT_ENDPOINT)
      @names = params.fetch(:names) { [] }
      @spec = params.fetch(:spec) { SPEC }
      @apikey = params.fetch(:apikey) { self.class.authenticate params }
    end

    def respond_to?(method, include_private = false)
      super || @spec[:subs].include?(method)
    end

    private

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
        names: @names + [method]
      }
      instance_variable_set "@#{method}", Raw.new(options)
    end

    def make_call(method, *args)
      self.class.module_eval "alias_method :#{method}, :call"
      send(method, *args)
    end

    def call(params = {})
      method = (@names + [__callee__.to_s]).join '.'
      spec = @spec[:subs][__callee__]
      options = self.class.validate method, spec[:params], params
      options.merge! api_key: @apikey, api_action: method
      self.class.parse self.class.post('', body: options).parsed_response
    end

    def self.parse(resp)
      unless resp['ERRORARRAY'].empty?
        fail "API Error on #{resp['ACTION']}: #{resp['ERRORARRAY']}"
      end
      resp
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

    def self.authenticate(params = {})
      creds = params.values_at :username, :password
      unless creds.all?  # Checks if either user or pass is nil
        fail ArgumentError, 'You must provide either an API key or user/pass'
      end
      user.getapikey(username: creds.first, password: creds.last)
    end
  end

  private

  VALIDATION_METHODS = {
    boolean: proc { |e| e == true },
    numeric: proc { |e| Integer(e) },
    string: proc { |e| e.to_s },
  }
end
