module UserRepository
  def save(user)
    raise NotImplementedError, "Subclasses must implement 'save'"
  end

  def getByEmail(email)
    raise NotImplementedError, "Subclasses must implement 'getByEmail'"
  end
end
