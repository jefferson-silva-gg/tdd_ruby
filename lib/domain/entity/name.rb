# frozen_string_literal: true

class Name
  attr_reader :value

  def initialize(name)
    @value = name
    validator
  end

  private

  def validator
    return unless @value.split.length < 2

    raise StandardError, 'Name must be at least 2 characters long'
  end
end
