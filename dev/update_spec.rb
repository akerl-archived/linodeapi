#!/usr/bin/env ruby

require 'erb'
require 'json'
require 'httparty'
require 'pp'

SPEC_PATH = 'lib/linodeapi/spec.rb'

TEMPLATE = '##
# Dynamically updated spec from the api.spec call
# rubocop:disable all

module LinodeAPI
  API_SPEC = <%= clean %>
end
'

raw = HTTParty.get('https://api.linode.com/?api_action=api.spec').body
spec = JSON.parse raw
clean = ''
PP.pp(spec, clean)
File.open(SPEC_PATH, 'w') { |fh| fh.write ERB.new(TEMPLATE).result }

puts 'Updated spec file'
