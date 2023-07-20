# frozen_string_literal: true

require 'domain/entity/password'

describe Password, type: :unit do
  context 'when use password classe' do
    let(:hash_password) do
      '0b74f70c40596a00f0736dc16f6afafee623c081a48acf24a4fffc5d' \
        '5957a821e277dc5b5ffb8ff507c9dd3b05c7b7f66dff94b39205afe4' \
        'e5b40d3aa36a1973'
    end
    it 'should create a valid password' do
      password = Password.create('Change@123', 'salt')

      expect(password.value).to eq(hash_password)
    end

    it 'should not create an invalid password' do
      expect { Password.create('1234567890', 'salt') }.to raise_error(StandardError, 'Invalid password')
    end

    it 'should create and validate a valid password' do
      plain_password = 'Change@123'
      instance = Password.create(plain_password, 'salt')

      expect(instance.validate(plain_password)).to be_truthy
    end
  end
end
