class Api::V1::GifsController < ApplicationController

  def random
    location = Location.geocoded(params['location'])
  end
end
