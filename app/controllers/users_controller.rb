class UsersController < ApplicationController
  before_action :signed_in_user,
                only: [:destroy, :following, :followers]

  def new
    @user = User.new
  end
  
  def index
    
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Framgia Books Store!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def following
    @title = "Following"
    @user = User.find params[:id]
    @users = @user.following_users.paginate page: params[:page]
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find params[:id]
    @users = @user.followers.paginate page: params[:page]
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password,
                                   :password_confirmation)
    end
end