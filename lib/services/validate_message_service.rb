# frozen_string_literal: true

class ValidationError < StandardError; end

class ValidateMessageService
  def call!(data)
    raise ValidationError, "no data error." if data.nil?

    json_string = data.is_a?(String) ? data : data.to_json

    begin
      JSON.parse(json_string)
    rescue JSON::ParserError
      raise ValidationError, "Parsing error."
    end
  end
end