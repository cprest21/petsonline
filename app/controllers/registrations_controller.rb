class RegistrationsController < Devise::RegistrationsController
  protected 

  def after_sign_up_path_for(resource)
  	#@user = current_user
  	#:user_id = @user.id
    if current_user.role == "owner"
    	'/owners/new'
    else current_user.role == "advertiser"
    	'/advertisers/new'
    end
  end
end