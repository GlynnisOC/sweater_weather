class Api::V1::RoadtripController < ApplicationController

  def show
    user = User.find_by(api_key: params[:api_key])
    render json: RoadtripSerializer.new(RoadtripFacade.new(origin: params['origin'], destination: params['destination']).expected_forecast)
  end
end
