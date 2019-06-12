ENV["RACK_ENV"] ||= "test"

require 'pry'
require 'rspec'
require "capybara/rspec"

require_relative '../server.rb'

set :environment, :test

Capybara.app = Sinatra::Application
