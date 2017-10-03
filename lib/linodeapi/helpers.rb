module LinodeAPI
  ##
  # HTTP / API parsing helpers
  module Helpers
    def error_check(resp)
      error = create_http_error(resp)
      raise(error) if error
      data = resp.parsed_response
      raise('Invalid API response received') if data.nil?
      parse data
    end

    def create_http_error(resp)
      code = resp.code
      return nil if code == 200
      delay = resp.headers['Retry-After']
      return RetryableHTTPError.new(code, delay) if delay
      HTTPError.new(code)
    end

    def parse(resp)
      resp['ERRORARRAY'].reject! { |x| x['ERRORCODE'].zero? }
      raise(APIError, resp) unless resp['ERRORARRAY'].empty?
      data = resp['DATA']
      data.is_a?(Hash) ? clean(data) : data.map { |x| clean x }
    end

    def clean(object)
      OpenStruct.new(Hash[object.map { |k, v| [k.downcase.to_sym, v] }])
    end

    def validate(method, mspec, given)
      mspec.each_with_object({}) do |(param, info), options|
        if given.include? param
          options[param] = VALIDATION_METHODS[info[:type]].call given[param]
        elsif info[:required]
          raise ArgumentError, "#{method} requires #{param}"
        end
      end
    end
  end
end
