class ApplicationController < ActionController::Base
rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Zugriff Verweigert! Bitte registrieren Sie sich! "
  redirect_to root_url
end
  def authenticate_admin_user!
  	redirect to new_user_session_path unless current_user && current_user.has_role?(:admin)
  end
end
