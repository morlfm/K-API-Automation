require_relative '../services/pet_service'
require_relative '../factory/pet_factory'
require 'factory_bot'
require 'faker'

describe 'Updating' do
  subject { Pet.new }
  context 'PUT', :update do
    it 'should update a pet name ' do
      body = {
        "pet_name": "Niko #{Faker::Name.last_name}"
      }.to_json
      responses = subject.get_pets
      response = subject.put_pet(body, responses.last['id'])
      expect(response.code).to eq 200
      expect(response['pet_name']).to include 'Niko'
    end

    it 'should update a pet age' do
      body = {
        "age": 5
      }.to_json
      responses = subject.get_pets
      response = subject.put_pet(body, responses.last['id'])
      expect(response.code).to eq 200
      expect(response['age']).to eq 5
    end

    it 'should not update without ID' do
      body = {
        "age": 5
      }.to_json
      response = subject.put_pet(body, '')
      expect(response.code).to eq 404
      expect(response.message).to eq 'Not Found'
    end
  end
end
