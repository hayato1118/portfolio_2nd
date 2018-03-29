class ClipsController < ApplicationController
before_action :authenticate_user!
	
	def create
			@user_id = current_user.id
			@topic_id = Topic.find(params[:id]).id
			@clip = Clip.new(topic_id: @topic_id, user_id: @user_id)
		if @clip.save
			redirect_to user_path(current_user)
		end
	end

	def destroy
			@clip = Clip.find(params[:id])
		if @clip.destroy
			redirect_to user_path(current_user)
		end
	end
end
