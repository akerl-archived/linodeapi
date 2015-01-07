#!/usr/bin/env ruby

require 'httparty'
require 'pp'
require 'erb'
require 'active_support/ordered_hash'

SPEC_PATH = 'lib/linodeapi/spec.rb'

TEMPLATE = '##
# Dynamically updated spec from the api.spec call
# rubocop:disable all

module LinodeAPI
  SPEC =
<%= clean %>
end
'
# rubocop:enable all

raw = HTTParty.get('https://api.linode.com/?api_action=api.spec').body
raw = JSON.parse(raw)['DATA']['METHODS']

spec = ActiveSupport::OrderedHash.new

raw.sort_by(&:first).each_with_object(spec) do |(method, info), acc|
  groups = method.split('.').map(&:to_sym)
  name = groups.pop

  params = info['PARAMETERS'].sort_by(&:first).map do |k, v|
    # rubocop:disable Style/MultilineOperationIndentation
    [
      k.downcase.to_sym,
      ActiveSupport::OrderedHash[
        desc: v['DESCRIPTION'],
        type: v['TYPE'].to_sym,
        required: v['REQUIRED']
      ]
    ]
    # rubocop:enable Style/MultilineOperationIndentation
  end

  local = groups.reduce(acc) do |layout, new|
    layout[new] ||= { type: :group, subs: {} }
    layout[new][:subs]
  end

  local[name] = {
    type: :call,
    desc: info['DESCRIPTION'],
    throws: info['THROWS'].split(','),
    params: ActiveSupport::OrderedHash[params]
  }
end

clean = ''
PP.pp({ type: 'group', subs: spec }, clean)
File.open(SPEC_PATH, 'w') { |fh| fh.write ERB.new(TEMPLATE).result }

puts 'Updated spec file'
