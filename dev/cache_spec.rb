#!/usr/bin/env ruby

require 'linodeapi'
require 'yaml'

SPEC_FILE = $ARGV.first || 'dev/spec.yml'
VERSION_FILE = File.join(File.dirname(SPEC_FILE), 'version')

def parse_node(node)
  return clean_node(node) if node[:type] == :call
  Hash[node[:subs].sort.map { |k, v| [k.to_s, parse_node(v)] }]
end

def clean_node(node)
  node.delete(:type)
  hash_to_array(node)
end

def hash_to_array(hash)
  return hash unless hash.is_a? Hash
  hash.to_a.sort.map { |x| Hash[x.first.to_s, hash_to_array(x.last)] }
end

result = parse_node(LinodeAPI.spec)

File.open(SPEC_FILE, 'w') { |fh| fh << YAML.dump(result) }
File.open(VERSION_FILE, 'w') { |fh| fh << LinodeAPI.spec_version }
