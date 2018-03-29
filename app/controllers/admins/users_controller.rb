class Admins::UsersController < ApplicationController
 before_action :authenticate_admin!
 layout 'admin.application'


  def top
    @users = User.all.order(updated_at: :desc)
    @topics = Topic.all.order(created_at: :desc)
    @contacts = Contact.all.order(created_at: :desc)
  end

  def index
  	@users = User.all
  end

	private
		def user_params
			params.require(:user).permit(:name , :email , :profile_image)
		end
end

