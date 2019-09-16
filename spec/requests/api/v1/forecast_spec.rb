require 'rails_helper'

RSpec.describe '/api/v1/forecast' do
  it 'returns the forecast for a specific city' do
    headers = {'Content-Type' => 'application/json', 'Accept' => 'application/json'}

    get '/api/v1/forecast', params: {location: 'denver,co'}, headers: headers
    expect(response.status).to eq(200)
    expect(response.content_type).to eq('application/json')
  end
end
