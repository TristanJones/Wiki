class ApplicationController < ActionController::Base
  	protect_from_forgery

  	def after_sign_in_path_for(resource)
 		pages_path
	end

	def after_sign_out_path_for(resource)
 		pages_path
	end
  	rescue_from CanCan::AccessDenied do |exception|
    redirect_to pages_path, :alert => exception.message
  end

end
