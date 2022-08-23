class ListsController < ApplicationController
  before_action :set_list, only: :destroy
  # GET /lists
  def index
    @lists = List.all
    render json: ListsSerializer.new(@lists).as_json
  end

  # POST /list
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
    params.permit(:name)
    params.permit(:userId)
  end

  def set_list
    @list = list.find(params[:id])
  end
end
