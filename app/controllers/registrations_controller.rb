class RegistrationsController < Devise::RegistrationsController
  protected 

  def after_sign_up_path_for(resource)
  	#@user = current_user
  	#:user_id = @user.id
    '/owners/index'
  end
end