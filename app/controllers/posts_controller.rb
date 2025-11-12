class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: [current_user.id] + current_user.followers.ids + current_user.followees.ids).order(created_at: :desc).includes(:user)
  end

  def like 
    @post = Post.find(params[:id])
    Like.create(user: current_user, post: @post)
    redirect_to posts_path
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to current_user.profile
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to current_user.profile
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id, :like_id)
  end
end
