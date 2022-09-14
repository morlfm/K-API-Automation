require 'base64'
require 'dotenv'
require 'factory_bot'
require 'faker'
require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'
require 'json'
require 'require_all'

require_all 'services'
require_all 'support'

RSpec.configure do |config|
  config.profile_examples = 10
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    config.include FactoryBot::Syntax::Methods
    Faker::Config.locale = :en
    config.before(:suite) do
      FactoryBot.find_definitions
      config.mock_with :rspec do |mocks|
        mocks.verify_partial_doubles = true
      end
    end
  end
end
