require_relative '../services/pet_service'
require_relative '../factory/pet_factory'
require 'factory_bot'
require 'faker'

describe 'Fetching' do
  subject { Pet.new }
  context 'GET', :get do
    it 'should return all pets' do
      response = subject.get_pets
      expect(response.code).to eq 200
      expect(response.message).to eq 'OK'
      expect(response[0]['pet_name']).to include 'Fido'
    end

    it 'should return a single pet' do
      responses = subject.get_pets
      last_id = responses.last['id']
      response = subject.get_pet(last_id)
      expect(response.code).to eq 200
      expect(response['pet_owner']).to include 'Mike'
    end

    it 'should not return a single pet due to non-existent ID' do
      response = subject.get_pet('99999')
      expect(response.code).to eq 404
      expect(response.message).to eq 'Not Found'
    end
  end
end
