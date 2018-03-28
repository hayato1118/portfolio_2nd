class Admins::UsersController < ApplicationController
 before_action :authenticate_admin!
 layout 'admin.application'


  def top
  	@user = User.all
  end

  def index
  	@user = User.all
  end

  def show
  end

  def edit
  end

	private
		def user_params
			params.require(:user).permit(:name , :email , :profile_image)
		end
end

