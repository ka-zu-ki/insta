class PostsController < ApplicationController

  def index
    user_ids = current_user.followings.pluck(:id)
    @posts = Post.where(user_id: user_ids)
    # @posts = Post.joins(:likes).group(Like.arel_table[:post_id]).where(user_id: user_ids)
    @post = Post.find_by(params[:post_id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: '保存できました'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:content, images: [])
  end
end