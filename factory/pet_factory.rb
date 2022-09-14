require 'factory_bot'
require 'faker'

class RegisterPet; end

FactoryBot.define do
  factory :first_pet do
    pet_owner { Faker::Name.name }
    pet_name { "Fido #{Faker::Name.name}" }
    color { 'black' }
    description { 'A very good dog' }
    age { 3 }
    species { 'cat' }
    vaccination_status { true }
    membership { true }
    services { ['bath,walk'] }

    trait :second_pet do
      pet_owner { Faker::Name.name }
      pet_name { "Fido #{Faker::Name.name}" }
      color { 'black' }
      age { 2 }
      species { 'dog' }
      vaccination_status { true }
      membership { true }
      services { ['walk'] }
    end
    initialize_with { new(attributes) }
  end
end