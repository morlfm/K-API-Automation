require_relative '../services/pet_service'
require_relative '../factory/pet_factory'
require 'factory_bot'
require 'faker'

describe 'Deletion' do
  subject { Pet.new }
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
