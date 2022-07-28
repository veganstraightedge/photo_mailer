class UsersController < ApplicationController
  before_action :authorize
  skip_before_action :authorize, only: :show

  # /@profile
  def show
    return redirect_to Current.user.path if request.path == '/profile'

    @user  = User.find_by username: params[:username]

    return redirect_to :root if @user.blank?

    @posts = @user.posts.published
    @posts = @posts.include_adult_content if Current.user&.adult?
  end

  # /settings
  def update
    form_name = params[:form_name]

    if Current.user.update(user_params)
      redirect_to Current.user.path, notice: "#{form_name.capitalize} settings saved."
    else
      render "/settings/#{form_name}"
    end
  end

  private

  def user_params
    params
      .require(:user)
      .permit(
        :adult_content,
        :avatar,
        :bio,
        :birthday,
        :email,
        :location,
        :name,
        :password,
        :password_confirmation,
        :show_age,
        :website,
        :username,
        identity_documents: []
      )
  end
end
