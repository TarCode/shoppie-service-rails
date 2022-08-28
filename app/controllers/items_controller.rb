# frozen_string_literal: true

# Items controller
class ItemsController < ApplicationController
  before_action :authorize_request
  before_action :set_item, only: :destroy
  # GET /items
  def index
    @items = Item.where(user: @current_user)
    render json: ItemsSerializer.new(@items).as_json
  end

  # GET /items/list/:id
  def items_by_list
    @items = Item.where(user: @current_user, list: params[:id])
    render json: ItemsSerializer.new(@items).as_json
  end

  # POST /items
  def create
    @item = Item.create(
      name: item_params[:name],
      list: item_params[:list],
      user: @current_user
    )
    if @item.save
      render json: ItemSerializer.new(@item).as_json, status: :created
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/:id
  def destroy
    @item.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:name, :list)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
