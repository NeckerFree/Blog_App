class PostsController < ApplicationController
  def index
    @user=User.includes(:posts, :comments).find(params[:id])
  end

  def show
   @post=User.includes(:posts, :comments).find(params[:id]).posts.find(params[:post_id])
  end
end

