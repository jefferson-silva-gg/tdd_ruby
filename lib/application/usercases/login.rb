class Login
  def initialize(user_repository)
    @user_repository = user_repository
  end

  def execute(email, password)
    user = @user_repository.getByEmail(email)
    raise "Authentication failed" unless user

    isValid_password = user.validate_password(password)
    raise "Authentication failed" unless isValid_password

    token = '1234567890'

    {
      name: user.name,
      token: token
    }
  end
end
