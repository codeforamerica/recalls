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
        stub_request(:get, "http://search.usa.gov/search/recalls/?format=json").
         with(:headers => {'Accept'=>'application/json'}).
         to_return(:status => 200, :body => fixture('recalls_search_response.json'), :headers => {})
      end
      
      it "should return a hash with the results" do
        response = USASearch.search
        response.is_a?(Hash).should be_true
        response["success"]["total"].should == 21840
      end
    end
    
    context "when a search returns an error" do
      before do
        stub_request(:get, "http://search.usa.gov/search/recalls/?format=json").
         with(:headers => {'Accept'=>'application/json'}).
         to_return(:status => 401, :body => "Invalid API Key", :headers => {})
      end
      
      it "should return an error" do
        response = USASearch.search
        response.is_a?(String).should be_true
        response.should == "Invalid API Key"
      end
    end
  end
end