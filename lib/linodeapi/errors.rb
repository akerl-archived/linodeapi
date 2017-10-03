module LinodeAPI
  ##
  # A standard HTTP error with an embedded error code
  class HTTPError < StandardError
    attr_reader :code

    def initialize(code, msg = 'HTTP Error encountered')
      @code = code
      super(msg)
    end
  end

  ##
  # A retryable error that has exceeded its max retries
  class RetriedHTTPError < HTTPError
    attr_reader :retries

    def initialize(code, retries, msg = nil)
      @retries = retries
      msg ||= "HTTP Error encountered (retried #{retries} times)"
      super(code, msg)
    end
  end

  ##
  # A retryable API error with embedded code and requested delay
  class RetryableHTTPError < HTTPError
    attr_reader :delay

    def initialize(code, delay, msg = 'Retryable HTTP Error encountered')
      @delay = delay.to_i
      super(code, msg)
    end
  end

  ##
  # An API error in the body of the HTTP response
  class APIError < StandardError
    attr_reader :action, :details

    def initialize(resp, msg = 'API Error encountered')
      @action = resp['ACTION']
      @details = resp['ERRORARRAY']
      super(msg)
    end
  end
end
