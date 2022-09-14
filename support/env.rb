require 'dotenv'

Dotenv.load('.env.development.local')
PASSWORD = ENV['PASSWORD']
USERNAME = ENV['USERNAME']
