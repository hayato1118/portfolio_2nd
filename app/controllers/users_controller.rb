class UsersController < ApplicationController
	# before_action :authenticate_user!
	before_action :screen_user


	def show
		@user = User.find(params[:id])
		@topics_kaminari_all = @user.topics
		@topics_kaminari = Kaminari.paginate_array(@topics_kaminari_all).page(params[:page]).per(5)

		@clips = Clip.where("user_id = ?", @user)
		@clips_kaminari_all = @user.clip_topics
		@clips_kaminari = Kaminari.paginate_array(@clips_kaminari_all).page(params[:page]).per(5)

		@user.update(follower_count: @user.followers.count)
	end

	def edit
		@users = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user.id)
	end

  def destroy
      @user = User.find(params[:id])
      @user.soft_delete
      sign_out(@user)
      redirect_to root_path
  end

  def following
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  
	private
		def user_params
			params.require(:user).permit(:name , :email , :profile_image)
		end

	def screen_user
      unless user_signed_in? || admin_signed_in?
        redirect_to root_path
      end
    end
end
