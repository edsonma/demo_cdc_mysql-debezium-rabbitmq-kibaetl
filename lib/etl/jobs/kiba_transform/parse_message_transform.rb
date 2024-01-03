#frozen_string_literal: true

require 'kiba'
require 'json'

class ValidationError < StandardError; end

class ParseMessageTransform
  def process(row)
    puts '[transform] Transforming data...'    
    puts "\t[transform] Transforming data to hash and get interest data" 

    raise ValidationError, "no data error." if row.nil?

    begin
      data = JSON.parse(row)
    rescue JSON::ParserError
      raise ValidationError, "Parsing error."
    end

    # Merge into a single dictionary
    merged_data = {
      "before_data": data["payload"]["before"],
      "after_data": data["payload"]["after"],
      "source_op": data["payload"]["op"]
    }

    puts "\t [transform] Parsed data: #{merged_data}"

    merged_data
  end
end

