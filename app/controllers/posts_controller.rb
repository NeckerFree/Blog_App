class PostsController < ApplicationController
  def index
    @user=User.includes(:posts, :comments).find(params[:id])
  end

  def show
    user=User.find(params[:id])
   
  end
end
