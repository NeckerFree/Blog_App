class LikesController < ApplicationController
  def new
    @user = User.find(params[:id])
    @post = User.includes(:posts, :comments).find(params[:id]).posts.find(params[:post_id])
    @comments = @post.recent_comments
  end

  def create
    puts params
    like = Like.new(post_id: params[:post_id], author_id: current_user.id)
    like.save
    redirect_to action: 'show', controller: 'posts', id: current_user.id, post_id: params[:post_id]
  end
end
