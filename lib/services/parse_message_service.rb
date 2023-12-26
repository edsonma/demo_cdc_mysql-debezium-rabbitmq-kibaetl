#frozen_string_literal: true
require 'json'

class ParseMessageService
  def call!(data)
    data = JSON.parse(data)

    # Merge into a single dictionary
    merged_data = {
      "before_data": data["payload"]["before"],
      "after_data": data["payload"]["after"],
      "source_op": data["payload"]["op"]
    }

    puts "\t[transform] Parsed data: #{merged_data}"

    merged_data
  end
end

