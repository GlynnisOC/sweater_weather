require 'rails_helper'

RSpec.describe '/api/v1/sessions' do
  it 'returns a 200 status and users api key' do
    user = User.create!('email': 'mousse@ballsrgreat.com', 'password': 'password', 'password_confirmation': 'password')

    headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
    params = { "email": "#{user.email}", "password": "#{user.password}" }

    post '/api/v1/sessions', params: params.to_json, headers: headers
    expect(response.status).to eq(200)
    expect(response.content_type).to eq('application/json')

    user_data = JSON.parse(response.body, symbolize_names: true)
    expect(user_data).to be_a Hash
    expect(user_data[:status]).to eq(200)
    expect(user_data).to have_key(:api_key)
  end

  describe 'edge case testing' do
    it 'returns an error message and a 400 status if incorrect credentials' do
      user = User.create!('email': 'mousse@ballsrgreat.com', 'password': 'password', 'password_confirmation': 'password')

      headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
      params = { "email": "mouse@ballsrgreat.com", "password": "#{user.password}" }

      post '/api/v1/sessions', params: params.to_json, headers: headers

      bad_request = JSON.parse(response.body, symbolize_names: true)
      expect(bad_request[:status]).to eq(400)
    end
  end
end
