class PostsController < ApplicationController
  def index
    @user = User.includes(:posts, :comments).find(params[:id])
  end

  def show
    @user = User.includes(:posts, :comments).find(params[:id])
    @post = User.includes(:posts, :comments).find(params[:id]).posts.find(params[:post_id])
  end
end
