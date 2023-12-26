#frozen_string_literal: true

require 'faraday'
require 'faraday/net_http'
require 'json'

class RetrieveJobDataTransform
  def process(row)
    puts '[transform] Transforming data...'
    puts "\t[transform] Retrieve Job Information by UUID - job_uuid: #{row}"

    raise ArgumentError, 'job_uuid cannot be nil' if row.nil?

    url = 'https://placeholder.com/'
    api_key = '<API_KEY>'

    conn = Faraday.new(url) do |f|
      f.headers['x-api-key'] = api_key # set the x-api-key header
      f.response :json # decode responses as JSON
      f.adapter :net_http # sets the Net::HTTP adapter for both HTTP and HTTPS
    end
    
    response = conn.get("api/jobs/#{row}")
    response.body
  end
end
