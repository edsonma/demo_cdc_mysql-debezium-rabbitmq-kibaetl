#frozen_string_literal: true
require 'bunny'

class BunnyAdapter
  def initialize(connection_string)
    @connection_string = connection_string
    @connection = Bunny.new(@connection_string)
    @connection.start
    @channel = @connection.create_channel
  end

  def get_event(queue_name, &block)    
    queue = @channel.queue(queue_name, durable: true)
    queue.subscribe(manual_ack: true, &block)
  end

  def disconnect
    @connection.close if @connection&.open?
  end
end