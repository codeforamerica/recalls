# -*- coding: utf-8 -*-

module Recalls
  class Client
    module Products
    include Recalls::Client::Connection
    
    # Returns a hash of products matching the search.
    #
    # @return {Hash}
    # @param query
    # @param start_date
    # @param end_date
    # @param organization opptions NHSTA, CPSC, CDC
    # @param upc
    # @param sort sort=date 
    # @param page
    # @param year only for NHSTA (Traffic)
    # @param make only for NHSTA (Traffic)
    # @param model only for NHSTA (Traffic)        
    # @see http://search.usa.gov/api/recalls
    # @example Returns results based upon queries
    #   Recalls.search(:query => "bad cheese")
    
      def search(options = {})
        options.merge!({:format => "json"})                
        response = get('', options) rescue "Invalid API Key"  
      end
      
    end
  end
end
