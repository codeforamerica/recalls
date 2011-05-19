require 'simplecov'
SimpleCov.start do
  add_group 'Recalls', 'lib/recalls'
  add_group 'Faraday', 'lib/faraday'
end

require File.expand_path('../../lib/recalls', __FILE__)
require 'rspec'
require 'webmock/rspec'

require 'recalls'

RSpec.configure do |config|
  config.include WebMock::API
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end