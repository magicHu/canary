class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
  	# You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_auth(auth, current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "#{auth.provider}") if is_navigational_format?
    else
      session["devise.auth"] = auth
      redirect_to new_user_registration_url
    end
  end

  private
  def auth
  	request.env["omniauth.auth"]
  end
end
