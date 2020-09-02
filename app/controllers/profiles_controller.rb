class ProfilesController < ApplicationController
  def show
    @profile = current_user.profile
  end

  def create
    @profile = current_user.build_profile(profile_params)
    @profile.save!
    
    redirect_to profile_path
  end


  def edit
    @profile = current_user.prepare_profile
  end

  def update
    @profile = current_user.prepare_profile
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to profile_path, notice: 'プロフィールを更新しました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  private
  def profile_params
    params.required(:profile).permit(:avatar)
  end
end