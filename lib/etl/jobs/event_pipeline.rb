# frozen_string_literal: true
require 'kiba'

require_relative '../../adapters/bunny_adapter'
require_relative 'kiba_source/rabbitmq_source'
require_relative 'kiba_source/test_source'
require_relative 'kiba_transform/validate_message_transform'
require_relative 'kiba_transform/parse_message_transform'
require_relative 'kiba_transform/extract_job_data_transform'
require_relative 'kiba_transform/api_source_transform'
require_relative 'kiba_destination/file_destination'


bunny_adapter = BunnyAdapter.new("amqp://mqadmin:mqadmin@localhost:5672/vhost")
queue_name = 'DispatchChangeDataCapture'

job = Kiba.parse do
  # source TestSource, bunny_adapter, queue_name
  source RabbitmqSource, bunny_adapter, queue_name
  
  # All this works
  transform ParseMessageTransform
  transform ValidateMessageTransform
  transform ExtractJobDataTransform

  # transform ApiSourceTransform

  destination FileDestination

  post_process do
    bunny_adapter.disconnect
  end
end

puts '# job started - Running Kiba job... '
Kiba.run(job)


