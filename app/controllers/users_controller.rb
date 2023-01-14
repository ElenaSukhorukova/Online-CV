# frozen_string_literal: true

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
    @contacts = Contact.one_record
    @pagy_course, @courses = pagy Course.meny_records, items: 3, page_param: :pagy_course
    @educations = Education.meny_records
    @pagy_experience, @experiences = pagy Experience.meny_records, items: 2, page_param: :pagy_experience
    @personal_details = PersonalDetail.one_record
    @pagy_project, @projects = pagy Project.meny_records, items: 2, page_param: :pagy_project
    @pagy_skill, @skills = pagy Skill.meny_records, items: 3, page_param: :pagy_skill
  end
end
