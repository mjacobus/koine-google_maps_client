require 'koine/google_maps_client/version'
require 'rest-client'
require 'json'

module Koine
  class GoogleMapsClient
    BASE_URL = 'https://maps.googleapis.com/maps/api'

    def initialize(api_key: nil, http_client: RestClient)
      @http_client = http_client
      @api_key = api_key
    end

    def geocode(address:)
      get('/geocode/json', address: address)
    end

    def get(uri, params = {})
      to_hash do
        http_client.get(url_for(uri), params: params.merge(key: api_key))
      end
    end

    private

    def url_for(uri)
      "#{BASE_URL}#{uri}"
    end

    def to_hash
      response = yield
      JSON.parse(response.body)
    end

    attr_reader :http_client
    attr_reader :api_key
  end
end
