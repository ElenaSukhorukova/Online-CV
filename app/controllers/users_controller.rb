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
    @courses = Course.meny_records
    @educations = Education.meny_records
    @experiences = Experience.meny_records
    @personal_details = PersonalDetail.one_record
    @projects = Project.meny_records
    @skills = Skill.meny_records
  end
end
