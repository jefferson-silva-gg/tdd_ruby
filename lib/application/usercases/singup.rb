require_relative "../../domain/entity/user"

class Signup
  def initialize(user_repository)
    @user_repository = user_repository
  end

  def execute(input)
    user = User.create(input[:name], input[:email], input[:password], input[:age])
    @user_repository.save(user)
  end
end
