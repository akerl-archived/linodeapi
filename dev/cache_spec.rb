#!/usr/bin/env ruby

require 'linodeapi'
require 'yaml'
require 'digest'

SPEC_FILE = 'dev/spec.yml'.freeze
VERSION_FILE = File.join(File.dirname(SPEC_FILE), 'version')

def parse_node(node)
  return clean_node(node.dup) if node[:type] == :call
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

def write_changes
  File.open(SPEC_FILE, 'w') { |fh| fh << YAML.dump(parse_node(LinodeAPI.spec)) }
  File.open(VERSION_FILE, 'w') { |fh| fh << LinodeAPI.spec_version }
end

def sha(string)
  Digest::SHA256.hexdigest(string)[0..7]
end

def all_changes
  {
    'version' => [
      File.read(VERSION_FILE).chomp,
      LinodeAPI.spec_version
    ],
    'spec' => [
      sha(File.read(SPEC_FILE)),
      sha(YAML.dump(parse_node(LinodeAPI.spec)))
    ]
  }
end

puts YAML.dump(all_changes)
write_changes unless ARGV.first == '--noop'
