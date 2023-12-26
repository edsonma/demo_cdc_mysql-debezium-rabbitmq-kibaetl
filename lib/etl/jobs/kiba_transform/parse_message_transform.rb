#frozen_string_literal: true

require 'json'

class ParseMessageTransform
  def process(row)
    puts '[transform] Transforming data...'
    puts "\t[transform] Transforming data to hash and get interest data" 

    data = JSON.parse(row)

    # Merge into a single dictionary
    merged_data = {
      "before_data": data["payload"]["before"],
      "after_data": data["payload"]["after"],
      "source_op": data["payload"]["op"]
    }

    puts "\t[transform] Parsed data: #{merged_data}"

    row = merged_data.dig(:after_data, 'job_uuid')
  end
end

