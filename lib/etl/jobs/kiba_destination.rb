# frozen_string_literal: true
require 'json'

# WIP - This class is not being used yet
class KibaDestination
  STDIN_FILE = 'stdin_file'
  ORM_MODEL = 'orm_model'

  def write(row)
    puts '[destination] Sending data to destination...'

    if row.is_a?(Hash)
      process_destination(row, STDIN_FILE)
    else
      raise ArgumentError, "Row is not a hash"
    end
  end
  
  private

  # Could be a service that calls async jobs to different type of destinations
  def process_destination(data, destination_type)
    destination_mapping = {
      STDIN_FILE => method(:write_to_file),
      ORM_MODEL => method(:update_model)
    }

    destination_mapping[destination_type].call(data) if destination_mapping.key?(destination_type)    
  end
  
  def write_to_file(data)
    puts "\t [destination] Writing data to file...]"
    File.open("data.json", "w") do |file|
      file.write(JSON.pretty_generate(data))
    end
  end

  ## placeholder for ORM model
  def update_model(data)
    # # Find record by placa
    # bike = Bike.find_by(placa: data['placa'])

    # # Update fields if exists
    # return bike.update(data) if bike.present?

    # # Or.. create new bike record
    # Bike.create!(data)
  end
end

