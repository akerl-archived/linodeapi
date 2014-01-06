#!/usr/bin/env ruby

require 'httparty'
require 'pp'
require 'erb'

SPEC_PATH = 'lib/linodeapi/spec.rb'

TEMPLATE = '##
# Dynamically updated spec from the api.spec call
# rubocop:disable all

module LinodeAPI
  SPEC =
<%= clean %>
end
'

raw = HTTParty.get('https://api.linode.com/?api_action=api.spec').body
raw = JSON.parse(raw)['DATA']['METHODS']

spec = raw.reduce(Hash.new) do |acc, (method, info)|
  groups = method.split('.').map(&:to_sym)
  name = groups.pop

  params = info['PARAMETERS'].map do |k, v|
    [ k, { desc: v['DESCRIPTION'], type: v['TYPE'], required: v['REQUIRED'] } ]
  end

  local = groups.reduce(acc) do |layout, new|
    layout[new] ||= { type: :group, subs: {} }
    layout[new][:subs]
  end
  local[name] = {
    type: :call,
    desc: info['DESCRIPTION'],
    throws: info['THROWS'].split(','),
    params: Hash[params],
  }

  acc
end

clean = ''
PP.pp(spec, clean)
File.open(SPEC_PATH, 'w') { |fh| fh.write ERB.new(TEMPLATE).result }

puts 'Updated spec file'
