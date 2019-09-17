require 'rails_helper'

RSpec.describe UnsplashService do
  describe 'instance method' do
    describe '#background(location)' do
      it 'returns a hash with a url for an image of the city' do
        location = 'nashville,tn'
        unsplashservice = UnsplashService.new
        response = unsplashservice.background(location)

        expect(response).to be_a(Hash)
      end
    end
  end
end
