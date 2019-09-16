class Api::V1::GifsController < ApplicationController

  def random
    location = Location.geocoded(params['location'])
    render json: GifsSerializer.new(location).daily_gifs
  end
end
