require 'rails_helper'

RSpec.describe '/api/v1/users' do
  it 'returns the users api key when querying' do
    headers = {'Content-Type' => 'application/json', 'Accept' => 'application/json'}
    params = {"email": "mousse@ballsrgreat.com", "password": 'password', "password_confirmation": 'password' }

    post '/api/v1/users', params: params, headers: headers
    expect(response.status).to eq(201)
    expect(response.content_type).to eq('application/json')

    user_data = JSON.parse(response.body, symbolize_names: true)
    expect(user_data).to be_a Hash

  end
end

# Response:
#
# status: 201
# body:
#
# {
#   "api_key": "jgn983hy48thw9begh98h4539h4",
# }
