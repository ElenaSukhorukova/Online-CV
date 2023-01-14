# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ErrorHandling
  include ApplicationHelper
  include Internationalization
  include Pagy::Backend
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :define_user

  add_flash_types :info, :danger, :warning, :success, :alert, :notice

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:locale])
  end

  def define_user
    @user = User.first
  end
end
