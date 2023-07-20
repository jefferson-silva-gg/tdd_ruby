# frozen_string_literal: true

require 'domain/entity/email'

describe Email, type: :unit do
  context 'when use email classe' do
    it 'should create a valid email' do
      email = Email.new 'john.doe@example.com'

      expect(email.value).to eq('john.doe@example.com')
    end

    it 'should not create an email if it is invalid' do
      expect { Email.new 'john' }.to raise_error(StandardError, 'Invalid email')
    end
  end
end
