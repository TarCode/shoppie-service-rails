# frozen_string_literal: true

# Lists controller
class ListsController < ApplicationController
  before_action :authorize_request
  before_action :set_list, only: :destroy
  # GET /lists
  def index
    @lists = List.where(user: @current_user)
    render json: ListsSerializer.new(@lists).as_json
  end

  # POST /lists
  def create
    @list = List.create(name: list_params[:name], user: @current_user)
    if @list.save
      render json: ListSerializer.new(@list).as_json, status: :created
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lists/:id
  def destroy
    @list.destroy
    head :no_content
  end

  private

  def list_params
    params.permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
