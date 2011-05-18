require ::File.expand_path('../client/connection', __FILE__)
require ::File.expand_path('../client/request', __FILE__)
require ::File.expand_path('../client/recalls.rb', __FILE__)


module USASearch
  class Client
    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    def initialize(options={})
      options = USASearch.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include USASearch::Client::Connection
    include USASearch::Client::Request
    include USASearch::Client::Recalls     
  end
end
