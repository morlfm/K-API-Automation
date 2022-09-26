require_relative '../services/pet_service'
require_relative '../factory/pet_factory'
require 'factory_bot'
require 'faker'

describe 'Register' do
  subject { Pet.new }
  context 'POST', :post do
    it 'should create a new pet' do
      body = {
        "pet_owner": "Mike #{Faker::Name.last_name}",
        "pet_name": "Fido #{Faker::Name.last_name}",
        "color": 'black',
        "description": 'A very good dog',
        "age": 3,
        "species": 'cat',
        "vaccination_status": true,
        "membership": true,
        "services": %w[bath walk]
      }.to_json
      response = subject.post_pet(body)
      expect(response.code).to eq 201
      expect(response['pet_name']).to include 'Fido'
      expect(response['services']).to be_a(Array) &&
                                      include('bath', 'walk')
    end

    it 'should not create a new pet due to wrong type of body data' do
      body = {
        "pet_owner": Faker::Name.first_name,
        "pet_name": "Fido #{Faker::Name.last_name}",
        "color": 'black',
        "description": 'A very good dog',
        "age": 3,
        "species": 'cat',
        "vaccination_status": true,
        "membership": true,
        "services": %w[bath walk]
      }
      response = subject.post_pet(body)
      expect(response.code).to eq 400
      expect(response.message).to eq 'Bad Request'
    end
  end
end
