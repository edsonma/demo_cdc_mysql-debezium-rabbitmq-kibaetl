# frozen_string_literal: true
require 'kiba'
require 'httparty'
require_relative '../../../service/api_service' 

class ApiSourceTransform
  def process(row)

    job_uuid = row[:job_uuid]
    puts "\t [api transform] job_uuid: #{job_uuid}"
    
    response = ApiService.new({job_uuid: job_uuid}).call

    puts "\t [api transform] response: #{response.body}"

    { api_response: response }
  end
end