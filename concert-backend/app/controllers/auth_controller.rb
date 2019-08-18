require 'byebug'

class AuthController < ApplicationController


  def create # POST /api/v1/login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])

      payload = {"user_id": @user.id}
      token = encode(payload)
      render json: {
        user: @user,
        token: token,
        authenticated: true
      }
    else
      
      render json: {
        message: "INCORRECT! YOU ARE A FRAUD!",
        authenticated: false
      }
    end
  end
end
