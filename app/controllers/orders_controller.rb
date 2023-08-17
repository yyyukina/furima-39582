class OrdersController < ApplicationController
    before_action :authenticate_user!, only: [:index, :create]
    before_action :set_item, only: [:index, :create]
    before_action :item_not_sold, only: [:index]

    def index
        gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
        @order_form = OrderForm.new
    end

    def create
        @order_form = OrderForm.new(order_params)
        if @order_form.valid?
           pay_item
           @order_form.save(params,current_user.id)
           redirect_to root_path
        else
           gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
           render :index, status: :unprocessable_entity
        end
    end

    private

  def order_params
    params.require(:order_form).permit(:postal_code, :region_id, :city, :address_line, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
          Payjp::Charge.create(
            amount: @item.price,
            card: order_params[:token],
            currency: 'jpy'
          )
  end

  def item_not_sold
    if @item.user == current_user || @item.order.present?
      redirect_to root_path
    end
  end

end
