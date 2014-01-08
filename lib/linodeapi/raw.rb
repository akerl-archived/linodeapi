require 'httparty'

##
# Raw API wrapper, dynamically loaded from the published spec

module LinodeAPI
  ##
  # Raw API object

  class Raw
    attr_reader :apikey

    def initialize(params = {})
      @spec = params.fetch(:spec) { LinodeAPI::SPEC }
      @apikey = params.fetch(:apikey) { authenticate params }
    end

    def respond_to?(method, include_private = false)
      super || @spec[:subs].include?(method)
    end

    private

    def method_missing(method, *args, &block)
      case @spec[:subs][method][:type]
      when :group then make_group method
      when :call then make_call method, *args
      else super
      end
    end

    def make_group(method)
      child = LinodeAPI::Raw.new(spec: @spec[:subs][method], apikey: @apikey)
      instance_variable_set "@#{method}", child
    end

    def make_call(method, params)
      'placeholder'
    end

    def authenticate(params = {})
      creds = params.values_at :username, :password
      unless creds.all?  # Checks if either user or pass is nil
        fail ArgumentError, 'You must provide either an API key or user/pass'
      end
      user.getapikey(username: creds.first, password: creds.last)
    end
  end
end
