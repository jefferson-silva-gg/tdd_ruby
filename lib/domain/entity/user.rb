require_relative "name"
require_relative "email"
require_relative "password"

class User
  attr_reader :name, :email, :password, :age

  private_class_method :new

  def initialize(name, email, password, age)
    @name = name
    @email = email
    @password = password
    @age = age

    if age < 18
      raise StandardError.new 'Invalid age'
    end
  end

  def self.create(name, email, password, age)
    new(Name.new(name).value, Email.new(email).value, Password.create(password, 'salt'), age)
  end

  def validate_password(password)
    @password.validate(password)
  end
end
