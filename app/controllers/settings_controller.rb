class SettingsController < ApplicationController
  before_action :authorize

  def account
    # /settings/account is handled by Devise’s RegistrationsController#edit
  end

  def birthday
    @title = 'Settings : Birthday'
  end

  def profile
    @title = 'Settings : Profile'
  end
end
