# -*- coding: utf-8 -*-

module USASearch
  class Client
    module Recalls
    include USASearch::Client::Connection
      def search(options = {})
        options.merge!({:format => "json"})                
        response = get('', options) rescue "Invalid API Key"
      end
    end
  end
end
