# frozen_string_literal: true
require 'kiba'
require 'pry'

class KibaSource
  def initialize(adapter, queue_name)
    @adapter = adapter
    @queue_name = queue_name
  end

  def each
    @adapter.get_event(@queue_name) do |_delivery_info, _properties, payload|
      puts '[source] Getting data from queue...'
      puts "\t[source] Getting event from queue #{@queue_name}..."
      yield payload
    end
  end
end