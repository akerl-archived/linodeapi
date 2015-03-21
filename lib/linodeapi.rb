require 'httparty'

##
# Linode API wrapper
module LinodeAPI
  ##
  # Default API endpoint

  DEFAULT_ENDPOINT = 'https://api.linode.com/'
  SPEC_URL = 'https://api.linode.com/?api_action=api.spec'

  class << self
    ##
    # Insert a helper .new() method for creating a new API object

    def new(*args)
      self::API.new(*args)
    end

    def spec
      @spec ||= { type: 'group', subs: fetch_spec }
    end

    private

    def fetch_spec
      raw = JSON.parse(HTTParty.get(SPEC_URL).body)['DATA']['METHODS']
      raw.each_with_object({}) do |(method, info), spec|
        name, groups = parse_method(method)
        params = parse_params(info['PARAMETERS'])
        add_call(spec, groups, name, params, info)
      end
    end

    def add_call(spec, groups, name, params, info)
      subgroup = nest_spec(spec, groups)
      subgroup[name] = {
        type: :call,
        desc: info['DESCRIPTION'],
        throws: info['THROWS'].split(','),
        params: Hash[params]
      }
    end

    def nest_spec(spec, groups)
      groups.reduce(spec) do |layout, new|
        layout[new] ||= { type: :group, subs: {} }
        layout[new][:subs]
      end
    end

    def parse_method(method)
      keys = method.split('.').map(&:to_sym)
      [keys.pop, keys]
    end

    def parse_params(params)
      params.map do |k, v|
        [
          k.downcase.to_sym,
          parse_args(v)
        ]
      end
    end

    def parse_args(args)
      {
        desc: args['DESCRIPTION'],
        type: args['TYPE'].to_sym,
        required: args['REQUIRED']
      }
    end
  end
end

require 'linodeapi/raw'
require 'linodeapi/api'
