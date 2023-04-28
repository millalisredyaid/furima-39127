class RegistrationsController < Devise::RegistrationsController
  # before_action :set_user, except: [:index, :new, :create]
  # before_action :authenticate_user!, except: [:index, :show]
  # before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  
  # def create
  #   @user = User.new(sign_up_params)
  #   if @user.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end
  
  # private
  
  # def sign_up_params
  #   params.require(:user).permit(:nikcname, :email, :password, :last-name, :first-name , :last-name-kana, :first-name-kana, :birth_date)
  # end
  
  # def create
  #   super do |resource|
  #     # 保存したい処理を実装
  #     sign_up(resource.nikcname, resource.password, resource.email, resource.last-name, resource.first-name, resource.last-name-kana, resource.first-name-kana, resource.birth_date)
  #     if resource.persisted?
  #       sign_in(resource)
  #     end
  #   end
  # end
  
  # private
  
  # def sign_up(name, password, email)
  #   user = User.find_by(email: email)
  #   sign_in(user) if user.present?
  #   redirect_to root_path
  # end
end