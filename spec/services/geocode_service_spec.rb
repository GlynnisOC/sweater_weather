require 'rails_helper'

RSpec.describe GeocodeService do
  describe 'instance method' do
    describe '#get_latitude_and_longitude' do
      it 'returns a hash with latitude and longitude for a location' do
        location = 'missoula,mt'
        geocodeservice = GeocodeService.new(location)
        response = geocodeservice.get_latitude_and_longitude

        expect(response).to be_a(Hash)
        expect(response).to have_key(:lat)
        expect(response).to have_key(:lng)
      end
    end
  end
end
