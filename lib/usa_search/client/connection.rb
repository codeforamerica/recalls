require 'faraday_middleware'
Dir[File.expand_path('../../../faraday/*.rb', __FILE__)].each{|file| require file}

module USASearch
  class Client
    # @private
    module Connection
      private

      def connection(raw=false)
        options = {
          :headers => {'Accept' => 'application/json'},
          :proxy => proxy,
          :ssl => {:verify => false},
          :url => 'http://search.usa.gov/search/recalls' + endpoint.to_s
        }

        Faraday::Connection.new(options) do |connection|
          connection.use Faraday::Request::Multipart
          unless raw
            connection.use Faraday::Response::Mashify
            case format.to_s.downcase
            when 'json'
              connection.use Faraday::Response::ParseJson
            when 'xml'
              connection.use Faraday::Response::ParseXml
            end
          end
          connection.use Faraday::Response::RaiseError
          connection.adapter(adapter)
        end
      end
    end
  end
end

