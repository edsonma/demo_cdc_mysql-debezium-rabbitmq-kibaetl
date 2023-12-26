# frozen_string_literal: true

class ValidationError < StandardError; end

class ValidateMessageService
  def call!(data)
    raise ValidationError, "no data error." if data.nil?

    json_string = data.is_a?(String) ? data : data.to_json

    json = {}

    begin
      json = JSON.parse(json_string)
    rescue JSON::ParserError
      raise ValidationError, "Parsing error."
    end

    validate_before_after_values(json)
  end

  private

  # Need to validate before and after values
  def validate_before_after_values(json)
    json['after'].each do |key, value|
      if value['answer'] == 0
        raise ValidationError, "Invalid value for #{key} - #{value['answer']}"
      end
    end
  end
end