##
# Linode API wrapper

module LinodeAPI
  class << self
    ##
    # Insert a helper .new() method for creating a new API object

    def new(*args)
      self::API.new(*args)
    end
  end
end

require 'linodeapi/spec'
require 'linodeapi/raw'
require 'linodeapi/api'
