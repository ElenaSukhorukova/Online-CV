class HomeController < ApplicationController
  before_action :define_variables

  def index
  end

  def admin
    render :index
  end
  
  private
    def define_variables
      @contacts = Contact.where(locale: locale.to_s).last
      @courses = Course.where(locale: locale.to_s).order(date_of_end: :desc)
      @educations = Education.where(locale: locale.to_s).order(date_of_end: :desc)
      @experiences = Experience.where(locale: locale.to_s).order(date_of_begin: :desc)
      @personal_details = PersonalDetail.where(locale: locale.to_s).last
      @projects = Project.where(locale: locale.to_s).order(created_at: :desc)
      @skills = Skill.where(locale: locale.to_s).order(:created_at)
      
      @user = User.last
    end
end
