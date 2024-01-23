require_relative 'environment'
require 'pp' #--> native to Ruby that enables us to pretty print with pp method
require 'httparty'

class ApiBase
include HTTParty
@@base_uri = Environment.get_api_base_uri

    def initialize(some_query, some_value)
        @options = { query: {key: some_query, value: some_value} }
    end

    def self.get_customers(accept_type)
        response = get("#{@@base_uri}/customers", headers: { 'Accept' => accept_type })
        if response.code == 200
            begin
              parsed_response = JSON.parse(response.body)
              pp parsed_response
            rescue JSON::ParserError => e
              puts "Error parsing JSON: #{e.message}"
            end
          else
            puts "HTTP request failed with status code #{response.code}"
          end
    end

end