if ENV['CI'] == 'true'
  require 'simplecov'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
  SimpleCov.start do
    add_filter '/spec/'
  end
end

require 'rspec'
require 'linodeapi'
require 'webmock'

WebMock.enable!

require 'vcr'
VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
  c.filter_sensitive_data('<USER>') { ENV['LINODE_USERNAME'] || 'test' }
  c.filter_sensitive_data('<PASSWORD>') { ENV['LINODE_PASSWORD'] || 'test' }
  c.filter_sensitive_data('<APIKEY>') { ENV['LINODE_APIKEY'] || 'test' }
end
