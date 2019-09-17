class Api::V1::ForecastsController < ApplicationController

  def show
    location = Location.geocoded(params['location'])
    f_facade = ForecastFacade.new(location)
    forecast = f_facade.forecast
    render json: ForecastSerializer.new(forecast)
  end
end
