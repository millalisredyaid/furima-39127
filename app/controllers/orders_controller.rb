class OrdersController < ApplicationController
  require 'payjp'
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_order, only: [:index,:create]
  
  def index
    
    @order_address = OrderAddress.new
  end


  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_order
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    elsif @item.order.present? || current_user.nil?
    redirect_to new_user_session_path
  end
end
  

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :street, :building, :phone).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.item_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  
end
