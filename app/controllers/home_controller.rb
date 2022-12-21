# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :define_variables!

  def index; end

  def admin
    render :index
  end

  private

  def define_variables!
    @contact = Contact.one_record if @contact
    @pagy_project, @projects = pagy Project.meny_records, items: 3, page_param: :pagy_project
    @pagy_experience, @experiences = pagy Experience.meny_records, items: 2, page_param: :pagy_experience
    @educations = Education.meny_records
    @personal_details = PersonalDetail.one_record.decorate if @personal_details
    @pagy_skill, @skills = pagy Skill.meny_records, items: 4, page_param: :pagy_skill
    @courses = Course.meny_records

    @user = User.last
  end
end
