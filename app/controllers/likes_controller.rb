class LikesController < ApplicationController
  def create
    like = Like.new(author_id: params[:user_id], post_id: params[:post_id])
    like.save
    redirect_to action: 'show', controller: 'posts', user_id: params[:user_id], id: params[:post_id]
  end
end
