# frozen_string_literal: true

require 'domain/entity/user'

describe User, type: :unit do
  context 'when the user is valid' do
    let(:name) { 'John Doe' }
    let(:email) { 'john.doe@example.com' }
    let(:password) { 'Change@123' }
    let(:age) { 20 }

    it 'should create a user instance' do
      user = User.create(name, email, password, age)
      expect(user.name).to eq(name)
    end

    it 'should get error when age is invalid' do
      expect { User.create(name, email, password, 17) }.to raise_error(StandardError, 'Invalid age')
    end
  end
end
