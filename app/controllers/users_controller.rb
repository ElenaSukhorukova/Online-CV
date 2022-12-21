class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :define_variables!

  def show
    @user = User.first
    @contact = @user.contacts.build
    @course = @user.courses.build
    @education = @user.educations.build
    @experience = @user.experiences.build
    @personal_detail = @user.personal_details.build
    @project = @user.projects.build
    @skill = @user.skills.build
  end

  private

  def define_variables!
    @contacts = Contact.where(locale: locale.to_s).last
    @courses = Course.where(locale: locale.to_s).order(date_of_end: :desc)
    @educations = Education.where(locale: locale.to_s).order(date_of_end: :desc)
    @experiences = Experience.where(locale: locale.to_s).order(date_of_begin: :desc)
    @personal_details = PersonalDetail.where(locale: locale.to_s).last
    @projects = Project.where(locale: locale.to_s).order(created_at: :desc)
    @skills = Skill.where(locale: locale.to_s).order(:created_at)
  end
end
