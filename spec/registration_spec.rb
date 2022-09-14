require_relative '../services/pet_service'

describe 'Registration', :pet_registration do
  subject { Pet.new }

  context 'GET' do
    it 'should return all pets' do
      response = subject.get_pets
      expect(response.code).to eq 200
      expect(response.message).to eq 'OK'
      expect(response[0]['pet_name']).to eq 'Fred'
    end

    it 'should return a single pet' do
      response = subject.get_pet(456)
      expect(response.code).to eq 200
      expect(response['pet_owner']).to eq 'Mike'
    end
  

context 'POST' do
  it 'should create a new pet' do
    body = {pet_registration: [attributes_for(:first_pet)] } 
    response = subject.post_pet(body)
    expect(response.code).to eq 201
    expect(response['pet_name']).to contain 'Fido'

  end 

end 


  end
end
