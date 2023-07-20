# frozen_string_literal: true

require 'application/usercases/singup'
require 'application/usercases/login'
require 'domain/entity/user'
require 'infra/repository/user_memory_repository'

describe Signup, type: :integration do
  context 'when the user do the signup on api' do
    let(:user_repository) { UserRepositoryMemory.new }

    it 'should log user on app' do
      input = {
        name: 'John Doe',
        email: 'john.doe@example.com',
        password: 'Change@123',
        age: 20
      }
      usercase_signup = Signup.new(user_repository)
      usercase_signup.execute(input)

      login = Login.new(user_repository)
      expected_response = login.execute(input[:email], input[:password])
      expect(expected_response[:name]).to eq('John Doe')
      expect(expected_response[:token]).to eq('1234567890')
    end
  end
end
