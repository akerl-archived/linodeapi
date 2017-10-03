module LinodeAPI
  ##
  # A wrapper for the Raw API that can retry retryable errors
  class Retryable < Raw
    def initialize(params = {})
      super
      @options[:max_retries] ||= 3
      @options[:max_delay] ||= 60
    end

    private

    alias single_call call

    def call(*args)
      call_with_retries(max_retries, *args)
    end

    def call_with_retries(remaining, *args)
      single_call(*args)
    rescue RetryableHTTPError => e
      raise(RetriedHTTPError.new(e.code, max_retries)) if remaining < 0
      delay = [e.delay, max_delay].min
      sleep delay
      call_with_retries(remaining - 1, *args)
    end

    def max_retries
      @options[:max_retries]
    end

    def max_delay
      @options[:max_delay]
    end
  end
end
