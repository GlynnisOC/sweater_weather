require 'rails_helper'

RSpec.describe 'class methods' do
  describe '#geocoded' do
    it 'returns the latitude and longitude of the location' do
      query_location = 'denver,co'
      lat_and_long = Location.geocoded(query_location)

      expect(lat_and_long).to eq({'lat': 39.7392358, 'lng': -104.990251})
    end
  end
end
