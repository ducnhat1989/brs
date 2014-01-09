class Admin::UsersController < ApplicationController
  include UsersHelper

  def index
    @users = User.paginate page: params[:page], per_page: 2
  end

  def edit
  	@user = User.find params[:id]
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes password: params[:user][:password],
                   password_confirmation: params[:user][:password_confirmation]
      flash[:success] = @user.username << " has reset password"
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  def destroy
  	user = User.find(params[:id])
  	unless !user.nil? && user_activiting?(user)
  		user.destroy!
      flash[:success] = "User deleted."
      redirect_to admin_users_path
    else
    	flash[:error] = "User is activiting. You can't remove."
      redirect_to admin_users_path
    end
  end
end