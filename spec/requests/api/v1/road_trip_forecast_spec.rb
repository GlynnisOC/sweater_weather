require 'rails_helper'

RSpec.describe '/api/v1/road_trip' do
  it 'returns the forecast for weather upon arrival on a road trip' do
    user = User.create!('email': 'mousse@ballsrgreat.com', 'password': 'password', 'password_confirmation': 'password')

    headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
    params = { "origin": "Denver,CO", "destination": "Pueblo,CO", "api_key": "#{user.api_key}" }

    post '/api/v1/road_trip', params: params.to_json, headers: headers
  end
end


# POST /api/v1/road_trip
# Content-Type: application/json
# Accept: application/json
#
# body:
#

# API key must be sent
# If no API key or an incorrect key is provided return 401 (Unauthorized)
# You will use the Google Directions API: https://developers.google.com/maps/documentation/directions/start
# in order to find out how long it will take to travel from the two locations,
# nd then deliver the weather forecast for the hour of arrival. For example, Denver
#  to Pueblo would take two hours. You will deliver a forecast two hours in
#  the future that includes the temperature and summary, and estimated travel time.
# The structure of the response is up to you, but should be JSON API 1.0
# Compliant.
