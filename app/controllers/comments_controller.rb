class CommentsController < ApplicationController
  def new
    @user = User.find(params[:id])
    @post = User.includes(:posts, :comments).find(params[:id]).posts.find(params[:post_id])
    @comments = @post.recent_comments
  end

  def create
    comm = params[:comment]
    @comment = Comment.new(post_id: params[:post_id], author_id: params[:user_id], text: comm[:text])
    @comment.save
    redirect_to action: 'show', controller: 'posts', user_id: params[:user_id], id: params[:post_id]
  end
end
