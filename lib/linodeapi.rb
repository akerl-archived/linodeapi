# frozen_string_literal: true

require 'httparty'

##
# Linode API wrapper
module LinodeAPI
  ##
  # Default API endpoint

  DEFAULT_ENDPOINT = 'https://api.linode.com/'.freeze
  SPEC_URL = 'https://api.linode.com/?api_action=api.spec'.freeze

  class << self
    def spec
      @spec ||= { type: :group, subs: parse_spec }
    end

    def spec_version
      @spec_version ||= raw_spec['DATA']['VERSION'].to_s
    end

    private

    def raw_spec
      @raw_spec ||= JSON.parse(HTTParty.get(SPEC_URL).body)
    end

    def parse_spec
      raw_spec['DATA']['METHODS'].each_with_object({}) do |(method, info), spec|
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

require 'linodeapi/errors'
require 'linodeapi/helpers'
require 'linodeapi/raw'
require 'linodeapi/retryable'
require 'linodeapi/version'