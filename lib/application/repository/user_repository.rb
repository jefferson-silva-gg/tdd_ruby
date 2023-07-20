# frozen_string_literal: true

module UserRepository
  def save(user)
    raise NotImplementedError, "Subclasses must implement 'save'"
  end

  def get_by_email(email)
    raise NotImplementedError, "Subclasses must implement 'get_by_email'"
  end
end
