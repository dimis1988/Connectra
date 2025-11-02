class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
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
    params.require(:post).permit(:content, :user_id)
  end
end
