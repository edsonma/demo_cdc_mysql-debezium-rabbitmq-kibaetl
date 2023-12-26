# frozen_string_literal: true

require 'json'

class ValidationError < StandardError; end

class ValidateMessageTransform
  def process(data)
    puts '[transform] Transforming data...'
    puts "\t[transform] Validating data..."

    raise ValidationError, "no data error." if data.nil?

    json_string = data.is_a?(String) ? data : data.to_json

    json = {}

    begin
      json = JSON.parse(json_string)
    rescue JSON::ParserError
      raise ValidationError, "Parsing error."
    end

    validate_before_after_values(json)

    data
  end

  private

  # Need to validate before and after values
  def validate_before_after_values(json)
    raise(ValidationError, "Invalid value for before - #{json.dig('before', 'answer')}") if json.dig('before', 'answer') == 0 
  end
end