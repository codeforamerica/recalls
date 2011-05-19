require ::File.expand_path('../recalls/version', __FILE__)
require ::File.expand_path('../recalls/configuration.rb', __FILE__)
require ::File.expand_path('../recalls/client', __FILE__)

module Recalls
  extend Configuration

  # Alias for Recalls::Client.new
  #
  # @return [Recalls::Client]
  def self.client(options={})
    Recalls::Client.new(options)
  end

  # Delegate to Recalls::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end
  
  def self.respond_to?(method, include_private=false)
    client.respond_to?(method, include_private) || super(method, include_private)
  end

  # Custom error class for rescuing from all Recalls errors
  class Error < StandardError; end

  # Raised when Recalls returns a 400 HTTP status code
  class BadRequest < Error; end

  # Raised when Recalls returns a 401 HTTP status code
  class Unauthorized < Error; end

  # Raised when Recalls returns a 403 HTTP status code
  class Forbidden < Error; end

  # Raised when Recalls returns a 404 HTTP status code
  class NotFound < Error; end

  # Raised when Recalls returns a 406 HTTP status code
  class NotAcceptable < Error; end

  # Raised when Recalls returns a 500 HTTP status code
  class InternalServerError < Error; end

  # Raised when Recalls returns a 502 HTTP status code
  class BadGateway < Error; end

  # Raised when Recalls returns a 503 HTTP status code
  class ServiceUnavailable < Error; end
end
