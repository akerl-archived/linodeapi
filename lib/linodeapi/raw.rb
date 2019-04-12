require 'httparty'
require 'ostruct'

##
# Raw API wrapper, dynamically loaded from the published spec
module LinodeAPI
  ##
  # Raw API object
  class Raw
    include HTTParty
    extend Helpers

    def initialize(params = {})
      @options = params
      @options[:endpoint] ||= DEFAULT_ENDPOINT
      @options[:names] ||= []
      @options[:spec] ||= LinodeAPI.spec
      @options[:apikey] ||= authenticate(params)
    end

    def respond_to_missing?(method, include_private = false)
      spec[:subs].include?(method) || super
    end

    def to_s
      'LinodeAPI::Raw object'
    end
    alias inspect to_s

    def names
      @names ||= @options[:names]
    end

    def spec
      @spec ||= @options[:spec]
    end

    def apikey
      @apikey ||= @options[:apikey]
    end

    def endpoint
      @endpoint ||= @options[:endpoint]
    end

    private

    def authenticate(params = {})
      return [] unless names.empty?
      unless (params.values_at :username, :password).all?
        raise ArgumentError, 'You must provide either an API key or user/pass'
      end
      user.getapikey(params).api_key
    end

    def method_missing(method, *args, &block)
      return super unless respond_to? method
      case spec[:subs][method][:type]
      when :group then make_group method
      when :call then make_call method, *args
      end
    end

    def make_group(method)
      group = self.class.new(
        @options.dup.merge(
          spec: spec[:subs][method],
          names: names + [method]
        )
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
      options = build_call_body(method, params)
      self.class.error_check self.class.post(
        '', body: options,
            base_uri: endpoint,
            headers: { 'User-Agent' => user_agent }
      )
    end

    def user_agent
      "linodeapi/#{LinodeAPI::VERSION} ruby/#{RUBY_VERSION}"
    end

    def build_call_body(method, params)
      mspec = spec[:subs][method]
      mname = (names + [method.to_s]).join '.'
      options = self.class.validate method, mspec[:params], params
      options[:api_key] = apikey
      options[:api_action] = mname
      options
    end
  end

  VALIDATION_METHODS = {
    boolean: proc { |e| !!e }, # rubocop:disable Style/DoubleNegation
    numeric: proc { |e| Integer(e) },
    string: proc(&:to_s)
  }.freeze
end
