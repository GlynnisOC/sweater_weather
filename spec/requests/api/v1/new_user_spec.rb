require 'rails_helper'

RSpec.describe '/api/v1/users' do
  it 'returns the users api key when querying' do
    headers = {'Content-Type' => 'application/json', 'Accept' => 'application/json'}
    params = {"email": "mousse@ballsrgreat.com", "password": 'password', "password_confirmation": 'password' }

    post '/api/v1/users', params: params.to_json, headers: headers
    expect(response.content_type).to eq('application/json')

    user_data = JSON.parse(response.body, symbolize_names: true)
    expect(user_data).to be_a Hash
    expect(user_data[:api_key]).to be_truthy
    expect(user_data[:status]).to eq(201)
  end
end
