class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  # def index
  #   @user = User.all
  # end
  
  # def edit
  # end

  # def new
  #   @user = User.new
  # end

  # def create
  # end

  # def update
  #   if current_user.update(user_params)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end

  # private

  # def user_params
  #   params.require(:user).permit(:name, :email)
  # end
end