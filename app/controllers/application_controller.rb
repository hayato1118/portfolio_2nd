class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :contants_class

	def after_sign_in_path_for(resource)
	    case resource
      when User
         topics_path
      when Admin
        admins_top_path
      end
	end

	def after_sign_out_path_for(resource)
	  topics_path
	end

  protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def contants_class
      @contact = Contact.new
  end
end
