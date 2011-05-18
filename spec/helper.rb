require 'simplecov'
SimpleCov.start
require File.expand_path('../../lib/usa_search', __FILE__)
require 'rspec'
require 'webmock/rspec'

require 'usa_search'

RSpec.configure do |config|
  config.include WebMock::API
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end