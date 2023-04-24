class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  
  def index
    @item = Item.includes(:user)
  end

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

  def show
    @item = item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
  end  

  def update
    if @item.update(item_params)
      redirect_to prototype_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end
  # def index
  #   @items = Item.all
  # end

  # def new
  #   @items = Item.new
  # end

  # def create
  # end

  # def destroy
  #   log_out if logged_in?
  #   redirect_to root_url
  # end
end
