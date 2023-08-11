class OrdersController < ApplicationController
    before_action :authenticate_user!, except: :index
    
    def index
        @item = Item.find(params[:item_id])
        @order_form = OrderForm.new
    end

    def create
        @order_form = OrderForm.new(order_params)
        if @order_form.valid?
           @order_form.save(params,current_user.id)
           redirect_to root_path
        else
           @item = Item.find(params[:item_id])
           render :index, status: :unprocessable_entity
        end
    end

    private

  def order_params
    params.require(:order_form).permit(:postal_code, :region_id, :city, :address_line, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
