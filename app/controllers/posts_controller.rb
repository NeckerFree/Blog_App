class PostsController < ApplicationController
  def index
    @user = User.includes(:comments).find(params[:user_id])
    @posts = User.find(params[:user_id]).recent_posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = User.includes(:posts, :comments).find(params[:user_id]).posts.find(params[:id])
    @comments = @post.recent_comments
  end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    parameters = post_params
    @post = Post.new(author_id: params[:user_id], title: parameters[:title], text: parameters[:text],
                     comments_counter: 0, likes_counter: 0)
    @post.save
    redirect_to action: 'show', controller: 'posts', user_id: params[:user_id], id: @post.id
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
