class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user
      render json: { api_key: user.api_key, status: 200 }
    else
      render json: { status: 400 }
    end
  end
end
