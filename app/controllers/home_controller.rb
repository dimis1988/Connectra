class HomeController < ApplicationController
  def index
    @users = User.last_five_users
    @posts = Post.last_five_posts
  end
end
