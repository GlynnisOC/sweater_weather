require 'rails_helper'

RSpec.describe '/api/v1/gifs' do
  it "returns a random gif based on day's forecast conditions" do
    headers = {'Content-Type' => 'application/json', 'Accept' => 'application/json'}

    get '/api/v1/gifs', params: {location: 'denver, co'}, headers: headers
    expect(response.status).to eq(200)
    expect(response.content_type).to eq('application/json')
  end
end
