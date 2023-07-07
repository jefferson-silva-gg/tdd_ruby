class Name
  attr_reader :value

  def initialize(name)
    @value = name
    validator
  end

  private
  def validator
    if @value.split(' ').length < 2
      raise StandardError.new 'Name must be at least 2 characters long'
    end
  end
end