class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user=User.includes(:posts).find(params[:id])
  end
end
# puts params
#     @post = Post.find(params[:id])
#     @user = current_user
#     @comments = @post.comments