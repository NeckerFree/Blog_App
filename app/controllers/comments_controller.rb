class CommentsController < ApplicationController
  def new
    @user = User.find(params[:id])
    @post = User.includes(:posts, :comments).find(params[:id]).posts.find(params[:post_id])
    @comments = @post.recent_comments
  end

  def create
    # puts current_user.id
    # puts params[:postid]
    # puts params[:text]
    comm = params[:comment]
    # post_id=params[:post_id]
    # puts "text param:"
    # text
    # parameters= post_comments
    @comment = Comment.new(post_id: params[:post_id], author_id: current_user.id, text: comm[:text])
    @comment.save
    # @comment.save
    redirect_to action: 'show', controller: 'posts', id: current_user.id, post_id: params[:post_id]
    # redirect_to action: "show", controller: "posts"
  end
  # def post_comments
  #   puts "text param:"
  #   puts params[:comment]
  #   params.require(:post).permit(:text, :post_id)
  # end
end
