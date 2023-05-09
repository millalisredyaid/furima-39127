class OrdersController < ApplicationController
  require 'payjp'

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  # def new
  #   # @order_address = OrderAddress.new
  # end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    # order = Order.create(user_id: current_user.id, item_id: @order_address.item_id)
    if @order_address.valid?
      Payjp.api_key = "sk_test_b030aeb1ad088bd7f0b958b6"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.item_price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :street, :building, :phone, :token).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  
end
