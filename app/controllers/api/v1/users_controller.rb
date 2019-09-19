class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: { api_key: user.new_api_key, status: 201 }
    else
      render json: { error: user.errors.full_messages.to_sentence, status: 400 }
    end
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
