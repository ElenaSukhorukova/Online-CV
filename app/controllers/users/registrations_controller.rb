# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]
    before_action :check_existing_user, only: [:new]

    protected

    def check_existing_user
      build_resource

      if resource_user
        redirect_to sign_in_path, danger: 'User alredy exists. Please sign in.'
      else
        render :new
      end
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:locale])
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:locale])
    end

    # The path used after sign up.

    # The path used after sign up for inactive accounts.

    def resource_user
      @resource ||= User.last
    end
  end
end
