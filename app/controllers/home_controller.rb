class HomeController < ApplicationController
  before_action :define_variables

  def index
  end

  def admin
    render :index
  end
  
  private
    def define_variables
      @contact = Contact.where(locale: locale.to_s).last
      @courses = Course.where(locale: locale.to_s).order(date_of_end: :desc)
      @pagy_skill, @skills = pagy Skill.where(locale: locale.to_s).order(:created_at), items: 4, page_param: :pagy_skill
      @personal_details = PersonalDetail.where(locale: locale.to_s).last
      @educations = Education.where(locale: locale.to_s).order(date_of_end: :desc)
      @pagy_experience, @experiences = pagy Experience.where(locale: locale.to_s).order(date_of_begin: :desc), items: 2, page_param: :pagy_experience
      @pagy_project, @projects = pagy Project.where(locale: locale.to_s).order(created_at: :desc), items: 3, page_param: :pagy_project
      
      @user = User.last
    end
end
