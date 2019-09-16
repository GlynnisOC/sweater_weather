class Api::V1::ForecastsController < ApplicationController

  def show
    location = Location.geocoded(params['location'])
    render json: ForecastSerializer.new(location)
  end
end
