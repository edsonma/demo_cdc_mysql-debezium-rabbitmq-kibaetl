#frozen_string_literal: true

require_relative '../adapters/api_adapter'

BASE_URI = 'https://url.com/api/'
API_KEY = '<api_key>'

class ApiService
  def initialize(params)
    @job_uuid = params[:job_uuid]
  end

  def call
    connection = ApiAdapter.new(BASE_URI, API_KEY).connection
    response = connection.get("jobs/#{@job_uuid}")
  end
end
