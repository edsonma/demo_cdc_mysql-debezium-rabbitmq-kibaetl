# frozen_string_literal: true
require 'kiba'
require_relative '../../adapters/bunny_adapter'
require_relative 'kiba_source'
require_relative 'kiba_transform/validate_message_transform'
require_relative 'kiba_transform/parse_message_transform'
require_relative 'kiba_transform/retrieve_job_data_transform'
require_relative 'kiba_destination'

bunny_adapter = BunnyAdapter.new("amqp://admin:lalala@localhost:5672/vhost")
queue_name = 'DispatchUpdate'

job = Kiba.parse do
  source KibaSource, bunny_adapter, queue_name

  transform ValidateMessageTransform
  transform ParseMessageTransform
  transform RetrieveJobDataTransform
  
  destination KibaDestination
end

puts '# job started - Running Kiba job... '
Kiba.run(job)

bunny_adapter.disconnect
