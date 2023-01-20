class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @following_users = @user.followings
    @follower_users = @user.followers
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render :show
    end

  end

  def follows
    @user = User.find(params[:id])
  end
  
  def followers
    @user = User.find(params[:id])
    # @users = user.followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :self_introduction)
  end

end
