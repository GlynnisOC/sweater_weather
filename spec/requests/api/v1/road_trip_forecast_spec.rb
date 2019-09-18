require 'rails_helper'

RSpec.describe '/api/v1/road_trip' do
  it 'returns the forecast for weather upon arrival on a road trip' do
    user = User.create!('email': 'mousse@ballsrgreat.com', 'password': 'password', 'password_confirmation': 'password')

    headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
    params = { "origin": "Denver,CO", "destination": "Pueblo,CO", "api_key": "#{user.api_key}" }

    post '/api/v1/road_trip', params: params.to_json, headers: headers
    expect(response.status).to eq(200)
    expect(response.content_type).to eq('application/json')

    future_forecast = JSON.parse(response.body, symbolize_names: true)

    expect(future_forecast).to be_a Hash
    expect(future_forecast[:data][:attributes]).to have_key(:forecast)
    expect(future_forecast[:data][:attributes]).to have_key(:temperature)
    expect(future_forecast[:data][:attributes]).to have_key(:travel_time)
  end
end
