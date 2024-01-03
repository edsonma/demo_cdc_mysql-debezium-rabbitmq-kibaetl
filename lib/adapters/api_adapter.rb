require 'faraday'

class ApiAdapter
  def initialize(base_url, api_key)    
    @base_url = base_url
    @api_key = api_key
  end

  def connection
    @connection ||= Faraday.new(url: @base_url) do |faraday|
      faraday.headers['x-api-key'] = @api_key
      faraday.response :json
      faraday.adapter :net_http
      faraday.options.timeout = 120
    end
  end

  def close_connection
    @connection.close if @connection&.open?
  end
end
