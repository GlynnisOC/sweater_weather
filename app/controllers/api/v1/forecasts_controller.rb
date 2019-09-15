class Api::V1::ForecastsController < ApplicationController

  def show
    # binding.pry
    location = Location.geocoded(params['location'])
    ForecastSerializer.new(location)
  end
end
