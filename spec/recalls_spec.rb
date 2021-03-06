require 'helper'

describe Recalls do
  before do
    Recalls.configure do |config|
      config.api_key = "badcheese"
    end
  end

  describe "search" do
    context "when a search returns a success" do
      before do
        stub_request(:get, "http://api.usa.gov/recalls/search/?format=json").
         with(:headers => {'Accept'=>'application/json'}).
         to_return(:status => 200, :body => fixture('recalls_search_response.json'), :headers => {})
      end
      
      it "should return a hash with the results" do
        response = Recalls.search
        response.is_a?(Hash).should be_true
        response["success"]["total"].should == 21840
      end
    end
    
    context "when a search returns an error" do
      before do
        stub_request(:get, "http://api.usa.gov/recalls/search/?format=json").
         with(:headers => {'Accept'=>'application/json'}).
         to_return(:status => 401, :body => "Invalid API Key", :headers => {})
      end
      
      it "should return an error" do
        response = Recalls.search
        response.is_a?(String).should be_true
        response.should == "Invalid API Key"
      end
    end
  end
end