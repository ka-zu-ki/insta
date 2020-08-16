class CommentsController < ApplicationController
  def new
    post = Post.find(params[:post_id])
    @comment = post.comments.build
  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params.merge(user_id: current_user.id))
    @comment.save!
    render json: @comment
  end

  def index
    @post = Post.find(params[:post_id])
    comments = @post.comments
  end

  def index_json
    @post = Post.find(params[:post_id])
    comments = @post.comments
    render json: comments
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
