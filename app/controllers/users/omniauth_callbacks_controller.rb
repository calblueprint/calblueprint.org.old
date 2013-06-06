class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.nil?
      flash[:error] = "No such user :( Make sure you link your Facebook account before you sign in!"
      redirect_to new_user_session_path
    elsif @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      flash[:error] = "Oops, something went wrong."
      redirect_to new_user_session_path
    end
  end
end
