# frozen_string_literal: true

require 'openssl'
require 'securerandom'

class Password
  attr_reader :value, :salt

  private_class_method :new

  def initialize(value, salt)
    @value = value
    @salt = salt
  end

  def self.create(password, salt = nil)
    raise StandardError, 'Invalid password' unless password.match(
      /(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z])(?=.*[!#@$%^&*(-)+=]).*$/
    )

    generated_salt = salt || SecureRandom.hex(20)
    hashed_value = OpenSSL::Digest::SHA512.hexdigest(password + generated_salt)

    new(hashed_value, generated_salt)
  end

  def validate(plain_password)
    hashed_value = OpenSSL::Digest::SHA512.hexdigest(plain_password + salt)
    value == hashed_value
  end
end
