require 'rails_helper'

RSpec.describe DarkskyService do
  describe 'instance method' do
    describe '#forecast(location)' do
      it 'returns a hash with weather forecast for the city' do
        location = { 'lat': 39.7205825, 'lng': -105.056658 }
        darkskyservice = DarkskyService.new
        response = darkskyservice.forecast(location)

        expect(response).to be_a(Hash)
        expect(response).to have_key(:latitude)
        expect(response).to have_key(:longitude)
        expect(response).to have_key(:currently)
        expect(response).to have_key(:minutely)
        expect(response).to have_key(:hourly)
      end
    end
  end
end
