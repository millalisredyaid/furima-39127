class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    order = Order.create(user_id: current_user.id, item_id: @order_address.item.id)
    if @oeder_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def oeder_params
    params.require(:oeder_address).permit(:postal_code, :prefecture, :city, :street, :building, :phone, :orders_id).merge(user_id: current_user.id)
  end

  
end
