# frozen_string_literal: true

class Login
  def initialize(user_repository)
    @user_repository = user_repository
  end

  def execute(email, password)
    user = @user_repository.get_by_email(email)
    raise 'Authentication failed' unless user

    is_valid_password = user.validate_password(password)
    raise 'Authentication failed' unless is_valid_password

    token = '1234567890'

    {
      name: user.name,
      token:
    }
  end
end
