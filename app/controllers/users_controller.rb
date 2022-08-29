class UsersController < ApplicationController
  before_action :authorize_request, except: :register
  before_action :find_user, except: %i[register]

  # GET /users/{id}
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def register
    @user = User.new(user_params)
    if @user.save
      token = JsonWebToken.encode(user_id: @user.id.to_s)
      time = Time.now + 24.hours.to_i
      render json: { token:, exp: time.strftime('%m-%d-%Y %H:%M'),
                     email: @user.email }, status: :ok
    else
      render json: { error: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  rescue Mongoid::Errors::InvalidValue
    render json: { error: 'All fields must be filled' }, status: :not_found
  end

  # PUT /users/{id}
  def update
    unless @user.update(user_params)
      render json: { error: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /users/{id}
  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find_by!(params[:id])
  rescue Mongoid::Errors::DocumentNotFound
    render json: { error: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(
      :email, :password, :password_confirmation
    )
  end
end
