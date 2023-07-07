require_relative "../../application/repository/user_repository"
require_relative "../../domain/entity/user"

class UserRepositoryMemory
  include UserRepository
  def initialize
    @users = []
  end

  def save(user)
    @users << user
  end

  def getByEmail(email)
    @users.find { |user| user.email == email }
  end
end
