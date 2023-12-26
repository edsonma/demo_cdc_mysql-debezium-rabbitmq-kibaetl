
# frozen_string_literal: true
require 'pry'
require 'json'
require_relative '../../services/validate_message_service'
require_relative '../../services/parse_message_service'

class KibaTransform  
  def process(row)
    puts '[transform] Transforming data...'
    
    puts "\t[transform] Validating data..." 
    ValidateMessageService.new.call!(row)

    puts "\t[transform] Transforming data to hash and get interest data" 
    ParseMessageService.new.call!(row)
  end
end







