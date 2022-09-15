require_relative '../services/pet_service'
require_relative '../factory/pet_factory'
require 'factory_bot'
require 'faker'

describe 'Registration' do
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

  context 'DELETE', :delete do

    it 'should delete a pet' do
      pets_registered = subject.get_pets
      response = subject.delete_pet(pets_registered[0]['id'])
      expect(response.code).to eq 204
      expect(response.message).to eq 'No Content'
    end

    it 'should not delete a pet passing invalid ID type' do
      response = subject.delete_pet('xsasdad')
      expect(response.code).to eq 404
      expect(response.message).to eq 'Not Found'
    end
  end
end
