class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :set_item, only: [:show, :edit, :update, :destroy]
  # before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  
  def index
    # @item = Item.includes(:user)
  end

  # def show
  # end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path 
    else
      render :new
    end
  end

  # def edit
  #   @item = Item.find(params[:id])
  # end  

  # def update
  #   if @item.update(item_params)
  #     redirect_to prototype_path(@item)
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   if @item.destroy
  #     redirect_to root_path
  #   else
  #     redirect_to root_path
  #   end
  # end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :category_id, :condition_id, :shipping_fee_status_id, :prefecture_id, :days_to_ship_id, :item_price).merge(user_id: current_user.id)
  end    
  

  # def set_item
  #   @item = Item.find(params[:id])
  # end

end
