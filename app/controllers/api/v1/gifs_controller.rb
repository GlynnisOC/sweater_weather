class Api::V1::GifsController < ApplicationController

  def random
    location = Location.geocoded(params['location'])
    json_forecast = ForecastSerializer.new(location).location_forecast
    render json: GifsSerializer.new(json_forecast).daily_gifs
  end
end
