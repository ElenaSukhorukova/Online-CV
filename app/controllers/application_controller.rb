# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ErrorHandling
  include ApplicationHelper
  include FlashLocale
  include Pagy::Backend
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  helper_method :i18n_model_name
  before_action :define_user

  add_flash_types :info, :danger, :warning, :success, :alert, :notice

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:locale])
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    return unless I18n.available_locales.map(&:to_s).include?(parsed_locale)

    parsed_locale.to_sym
  end

  def define_user
    @user = User.first
  end
end
