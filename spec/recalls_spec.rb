require 'helper'

describe USASearch do
  before do
    USASearch.configure do |config|
      config.api_key = "badcheese"
    end
    
    describe "search" do
      context "when a search returns a success" do
        before do
          @recalls_search_result = File.read(File.join("spec", "fixtures", "recalls_search_response.json"))
          stub_request(:get, "http://search.usa.gov/search/recalls").with(:headers => {'Accept'=>'*/*'}).to_return(:status => 200, :body => @body, :headers => {})
        end
      
        it "should return a hash with the results" do
          response = USASearch.search
          response.is_a?(Hash).should be_true
          response["success"]["total"].should == 21840
        end
      end
    end
  end
end