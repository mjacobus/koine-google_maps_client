require "spec_helper"

RSpec.describe Koine::GoogleMapsClient do
  subject do
    described_class.new(api_key: ENV['API_KEY'])
  end

  describe '#geolocation' do
    it 'returns the geolocation of addresses' do
      address = 'Dammtorstraße 30, Hamburg'

      data = subject.geocode(address: address)

      location = data['results'][0]['geometry']['location']

      expect(location['lat']).to eq(53.55634689999999)
      expect(location['lng']).to eq(9.9884091)
    end
  end
end
