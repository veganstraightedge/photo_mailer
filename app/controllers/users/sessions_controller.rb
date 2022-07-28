module Users
  class SessionsController < Devise::SessionsController
    skip_before_action :set_current_user

    def create
      user = User.find_by email: user_params[:email]
      return redirect_to :new_user_session, alert: 'Invalid email/username or password' if user.blank?

      if user.valid_password?(user_params[:password])
        sign_in user
        redirect_path = params[:redirect_path] || :root
        redirect_to redirect_path, notice: 'Signed in!'
      else
        redirect_to :new_user_session, alert: 'Invalid email/username or password'
      end
    end

    protected

    def user_params
      params.require(:user).permit(:username, :password, :email, :remember_me)
    end
  end
end
