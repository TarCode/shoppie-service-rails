# frozen_string_literal: true

# Lists controller
class ListsController < ApplicationController
  before_action :set_list, only: :destroy
  # GET /lists
  def index
    @lists = List.all
    render json: ListsSerializer.new(@lists).as_json
  end

  # POST /lists
  def create
    @list = List.create(list_params)
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
    params.permit(:name, :userId)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
