ENV['RACK_ENV'] = 'test'

require './config/environment'
require 'rack/test'
require 'rspec'
require 'capybara/cucumber'
require 'pry'
require 'database_cleaner'
require 'database_cleaner/cucumber'
require 'launchy'
require 'faker'


Capybara.app = SlowFoodApp

DatabaseCleaner.strategy = :transaction

Around do |_scenario, block|
  DatabaseCleaner.cleaning(&block)
end
