class ApplicationController < ActionController::Base
	before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to users_url, :alert => exception.message
  	#root
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :role) }
    #devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    #devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

  #def after_sign_in_path_for(resource)
  #  stored_location_for(resource) ||
  #    if resource.is_a?(Owner)
  #      '/owners/new'
  #    elsif resource.is_a?(Advertiser)
  #      '/advertisers/new'
  #    end
  #end
  def stored_location_for(resource_or_scope)
    nil
  end

  def after_sign_in_path_for(resource_or_scope)
    if current_user.role == "owner"
      '/owners/new'
    elsif current_user.role == "advertiser"
      '/advertisers/new'
    else
      '/users'
    end
  end

end
