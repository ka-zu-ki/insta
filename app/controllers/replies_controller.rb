class RepliesController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @reply = @comment.replies.build
  end

  def create
    @post = Post.find(params[:post_id])
    comment = Comment.find(params[:comment_id])
    @reply = comment.replies.build(reply_params.merge(user_id: current_user.id, post_id: @post.id))
    @reply.save!
    redirect_to post_comments_path(@post)
  end

  def index
    @replies = Reply.all
  end

  private
  def reply_params
    params.permit(:content, :account_name)
  end
end