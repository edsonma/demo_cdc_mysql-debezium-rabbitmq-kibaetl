#frozen_string_literal: true

class ExtractJobDataTransform
  def process(row)
    merged_data = {
      "job_uuid": row.dig(:after_data, 'job_uuid'),
      "operation": row.dig(:source_op)
    }

    puts "\t[transform] Retrieve Job Information by UUID: #{merged_data}"
    merged_data
  end
end
