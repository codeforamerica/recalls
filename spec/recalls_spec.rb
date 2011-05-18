require 'helper'

describe USASearch do
  before do
    USASearch.configure do |config|
      config.api_key = "badcheese"
    end
  end

  describe "search" do
    context "when a search returns a success" do
      before do
        stub_request(:get, 'http://search.usa.gov/search/recalls').
        with(:api_key => 'badcheese', :format => "json").
        to_return(:body => fixture('recalls_search_response.json'), :headers => {'Content-Type' => 'text/json; charset=utf-8'})
      end
      
      it "should return a hash with the results" do
        response = USASearch.search
        response.is_a?(Hash).should be_true
        response["success"]["total"].should == 21840
      end
    end
  end
end