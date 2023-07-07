require 'domain/entity/name'

describe Name, type: :unit do
  context 'when use name classe' do
    it 'should create a valid name' do
      name = Name.new 'John Doe'

      expect(name.value).to eq('John Doe')
    end

    it 'should not create a name if it is invalid' do
      expect{Name.new 'John'}.to raise_error(StandardError, 'Name must be at least 2 characters long')
    end
  end
end
