class PostsController < ApplicationController
  def index
    @user = User.includes(:comments).find(params[:id])
    @posts = User.find(params[:id]).recent_posts
  end

  def show
    @user = User.find(params[:id])
    @post = User.includes(:posts, :comments).find(params[:id]).posts.find(params[:post_id])
    @comments = @post.recent_comments
  end
end
