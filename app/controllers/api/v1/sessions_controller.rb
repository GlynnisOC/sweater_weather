class Api::V1::SessionsController < ApplicationController

  def create
    binding.pry
    user = User.find_by(params)
  end
end
