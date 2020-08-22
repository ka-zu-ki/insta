class PostsController < ApplicationController

  def index
    # user_ids = current_user.followings.pluck(:id)
    # day = Range.new(Time.zone.now, Time.zone.now.tomorrow)
    # @posts = Post.where(user_id: user_ids).order(created_at: :asc)
    # @posts = Post.joins(:likes).group(Like.arel_table[:post_id]).where(user_id: user_ids)
    # @posts = Post.order(created_at: :asc)
    # .where(user_id: user_ids)
    # .joins(:likes)
    # .group(Like.count.limit(5)
    # @post = Post.find_by(params[:post_id])

    @posts = Post.all
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