class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id.to_s)
      time = Time.now + 24.hours.to_i
      render json: { token:, exp: time.strftime('%m-%d-%Y %H:%M'),
                     email: @user.email }, status: :ok
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  rescue Mongoid::Errors::DocumentNotFound
    render json: { error: 'Invalid credentials' }, status: :not_found
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
