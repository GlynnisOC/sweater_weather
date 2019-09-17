require 'rails_helper'

RSpec.describe '/api/v1/forecast' do
  it 'returns the forecast for a specific city' do
    headers = {'Content-Type' => 'application/json', 'Accept' => 'application/json'}

    get '/api/v1/forecast', params: {location: 'denver,co'}, headers: headers
    expect(response.status).to eq(200)
    expect(response.content_type).to eq('application/json')

    forecast_data = JSON.parse(response.body, symbolize_names: true)

    expect(forecast_data).to be_a Hash
    expect(forecast_data[:data][:attributes][:time]).to eq('America/Denver')
  end
end
