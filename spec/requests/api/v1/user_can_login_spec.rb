require 'rails_helper'

RSpec.describe '/api/v1/sessions' do
  it 'returns a 200 status and users api key' do
    headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
    params = { "email": "mousse@ballsrgreat.com", "password": 'password' }

    post '/api/v1/sessions', params: params.to_json, headers: headers
    expect(response.status).to eq(200)
    expect(response.content_type).to eq('application/json')

    user_data = JSON.parse(response.body, symbolize_names: true)
    expect(user_data).to be_a Hash
    expect(user_data[:status]).to eq(200)
  end
end

# Response:
#
# status: 200
# body:
#
# {
#   "api_key": "jgn983hy48thw9begh98h4539h4",
# }
