class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.includes(:user).find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
    if user_signed_in? && current_user.id == @item.user_id
      render :edit
    else
      redirect_to new_user_session_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :fee_id, :region_id, :shipping_day_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
