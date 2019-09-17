class Api::V1::ForecastsController < ApplicationController

  def show
    render json: ForecastSerializer.new(ForecastFacade.new(Location.geocoded(params['location'])).forecast)
  end
end
