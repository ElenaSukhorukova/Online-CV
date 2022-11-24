class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  before_action :define_data
  helper_method :i18n_model_name

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
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? 
      parsed_locale.to_sym : 
      nil
  end

  def define_data
    @contact = Contact.where(locale: locale.to_s).last || nil
    @courses = Course.where(locale: locale.to_s).order(year: :desc)
    @educations = Education.where(locale: locale.to_s).order(year: :desc)
    @experiences = Experience.where(locale: locale.to_s).order(date_begin: :desc)
    @personal_datum = PersonalDetail.where(locale: locale.to_s).last || nil
    @projects = Project.where(locale: locale.to_s).order(created_at: :desc)
    @skills = Skill.where(locale: locale.to_s).order(:created_at)
    
    @user = User.last
  
  #   @params_for_show = [@contact || 'Contact', @courses, @educations, @experiences, @personal_datum || 'PersonalDatum', @projects, @skills]

  #   @keys = @params_for_show.map do |data|
  #     if data.blank?   
  #       if data.class.to_s.split(/::/)[1] == 'ActiveRecord_Relation'
  #         data = data.class.to_s.split(/::/)[0] << 's'
  #       else
  #         data.class
  #       end
  #      elsif data.class == String
  #       data
  #     end
  #   end
  #   @keys.compact!
  end

  def i18n_model_name(model)
   model.model_name.human
  end
end
