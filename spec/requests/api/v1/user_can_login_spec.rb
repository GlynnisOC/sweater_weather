require 'rails_helper'

RSpec.describe '/api/v1/sessions' do
  it 'returns an image of the city whose forecast I want' do
    headers = {'Content-Type' => 'application/json', 'Accept' => 'application/json'}

    get '/api/v1/backgrounds', params: {location: 'denver,co'}, headers: headers
    expect(response.status).to eq(200)
    expect(response.content_type).to eq('application/json')

    background_data = JSON.parse(response.body, symbolize_names: true)
    expect(background_data).to be_a Hash
    expect(background_data).to have_key(:data)
  end
end

# POST /api/v1/sessions
# Content-Type: application/json
# Accept: application/json
#
# {
#   "email": "whatever@example.com",
#   "password": "password"
# }
# Response:
#
# status: 200
# body:
#
# {
#   "api_key": "jgn983hy48thw9begh98h4539h4",
# }
