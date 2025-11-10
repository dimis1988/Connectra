class UsersController < ApplicationController
  def index
    @users = User.includes(:profile)
  end

  def show 
  end

  def follow
    @user = User.find(params[:id])
    current_user.followees << @user
    redirect_back(fallback_location: profile_path(@user))
  end 

  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.find_by(followee_id: @user.id).destroy
    redirect_back(fallback_location: profile_path(@user))
  end
end 
