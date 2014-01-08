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
      when :group
        options = { spec: @spec[:subs][method], apikey: @apikey }
        instance_variable_set "@#{method}", Raw.new(options)
      when :call
        self.class.module_eval "alias_method :#{method}, :call"
        send(method, *args)
      end
    end

    def call(params = {})
      method = __callee__
      spec = @spec[:subs][method]
      options = self.class.validate method, spec[:params], params
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
