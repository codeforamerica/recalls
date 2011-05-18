require 'helper'

describe USASearch do
  before do
    USASearch.configure do |config|
      config.api_key     = 'badcheese'
    end
  end
end