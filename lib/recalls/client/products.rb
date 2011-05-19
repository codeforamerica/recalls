# -*- coding: utf-8 -*-

module Recalls
  class Client
    module Products
    include Recalls::Client::Connection
      def search(options = {})
        options.merge!({:format => "json"})                
        response = get('', options) rescue "Invalid API Key"
      end
    end
  end
end
