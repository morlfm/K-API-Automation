require 'dotenv'
require 'rspec'
require 'httparty'
require 'factory_bot'

Dotenv.load('.env.development.local')
PASSWORD = ENV['PASSWORD']
USERNAME = ENV['USERNAME']

