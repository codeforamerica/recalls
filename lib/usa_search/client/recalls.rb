# -*- coding: utf-8 -*-
require 'JSON'

module USASearch
  class Client
    module Recalls
    include USASearch::Client::Connection
      def search(options = {})
        options.merge!({:format => "json"})                
        response = get('', options)
      end
    end
  end
end
