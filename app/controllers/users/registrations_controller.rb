module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    protected

    def configure_sign_up_params
      devise_parameter_sanitizer.for(:sign_up) << [:name, :uid, :provider]
    end

    def configure_account_update_params
      devise_parameter_sanitizer.for(:account_update) << [:name, :uid, :provider]
    end
  end
end
