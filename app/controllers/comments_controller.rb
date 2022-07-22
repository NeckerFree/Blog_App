class CommentsController < ApplicationController
  def create
    puts current_user.id 
    puts params[:postid]
    puts params[:text]
    # parameters= post_comments
    @comment= Comment.new(post_id: params[:postid], author_id: current_user.id, text: params[:text] )
    @comment.save
    # redirect_to action: "show", controller: "posts", id: current_user.id, post_id: @comment.id
    # redirect_to action: "show", controller: "posts"
  end
  def post_comments
    puts params
    params.require(:post).permit(:text, :postid)
  end 
end    