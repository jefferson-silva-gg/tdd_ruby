# frozen_string_literal: true

class Email
  attr_reader :value

  def initialize(email)
    raise StandardError, 'Invalid email' unless email.downcase.match?(
      /^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}$/
    )

    @value = email
  end
end
