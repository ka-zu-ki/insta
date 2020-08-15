class CommentsController < ApplicationController
  def new
    post = Post.find(params[:post_id])
    @comment = post.comments.build
  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params.merge(user_id: current_user.id))
    if @comment.save
      redirect_to post_comments_path(post), notice: 'コメントを追加'
    else
      flash.now[:error] = '更新できませんでした'
      render :new
    end
  end

  def show
    @post = Post.find(params[:post_id])
    comment = @post.comments.find(params[:id])
    render json: comment
  end

  def index
    @post = Post.find(params[:post_id])
    @comment = Comment.all
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
