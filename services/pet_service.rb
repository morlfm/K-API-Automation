require_relative '../support/env'

class Pet
  include HTTParty

  DEFAULT_HEADERS = {
    'Content-Type' => 'application/json',
    'Accept' => 'application/json'
  }

  AUTH = { username: USERNAME, password: PASSWORD }.freeze

  def initialize
    super
    self.class.base_uri 'https://sdet-challenge.herokuapp.com/api/v1/pet_registrations'
    self.class.format :json
  end

  def get_pets
    self.class.get('/', basic_auth: AUTH, headers: DEFAULT_HEADERS)
  end

  def post_pet(body)
    self.class.post('/', basic_auth: AUTH, headers: DEFAULT_HEADERS, body: body)
  end

  def put_pet(body, id)
    self.class.put("/#{id}", basic_auth: AUTH, headers: DEFAULT_HEADERS, body: body)
  end

  def delete_pet(id)
    self.class.delete("/#{id}", basic_auth: AUTH, headers: DEFAULT_HEADERS)
  end

  def get_pet(id)
    self.class.get("/#{id}", basic_auth: AUTH, headers: DEFAULT_HEADERS)
  end
end
