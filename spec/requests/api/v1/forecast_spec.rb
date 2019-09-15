require 'rails_helper'

RSpec.describe '/api/v1/forecast' do
  it 'returns the forecast for a specific city' do
    headers = {'Content-Type' => 'application/json', 'Accept' => 'application/json'}

    get '/api/v1/forecast', params: {location: 'denver,co'}, headers: headers
    expect(status_code).to eq(200)
  end
end


# GET /api/v1/forecast?location=denver,co
# Content-Type: application/json
# Accept: application/json
