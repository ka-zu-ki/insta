class UnfollowsController < ApplicationController
  def show
    @user = User.find(params[:id])
    follow_status = current_user.has_followed?(@user)
    render json: { hasFollowed: follow_status }
  end

  def create
    current_user.unfollow!(params[:account_id])
    render json: { status: 'ok' }
  end
end