# frozen_string_literal: true

require 'kiba'

class ValidateMessageTransform
  def process(data)
    puts '\t[transform] Validating interested data...'

    raise(ValidationError, "Ignores operation that is not update.") unless update_operation?(data)

    raise(ValidationError, "Ignores if is not answer field changes.") unless miss_use_changes?(data)

    data
  end

  private

  def update_operation?(data)
    data.dig(:source_op) == 'u'
  end

  def miss_use_changes?(data)
    (data.dig(:before_data, 'answer') == '0') && (data.dig(:after_data, 'answer') == '1')
  end
end