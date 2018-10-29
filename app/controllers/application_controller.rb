class ApplicationController < ActionController::Base

	before_action :authenticate_user! #configure_permitted_parameters, if: :devise_controller?から変更

	protected

	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
	  devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
	  devise_parameter_sanitizer.permit(:account_update, keys: [:username])
	end
	def after_sign_in_path_for(resource)
  	user_path(current_user)
	end


end
