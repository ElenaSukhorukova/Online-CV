# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :define_variables!

  def index; end

  def admin
    render :index
  end

  private

  def define_variables!
    @contact = Contact.one_record if Contact.any?
    @pagy_project, @projects = pagy Project.meny_records, items: 3, page_param: :pagy_project
    @pagy_experience, @experiences = pagy Experience.meny_records, items: 2, page_param: :pagy_experience
    @educations = Education.meny_records
    @personal_details = PersonalDetail.one_record.decorate if PersonalDetail.any?
    @pagy_skill, @skills = pagy Skill.meny_records, items: 4, page_param: :pagy_skill
    @pagy_course, @courses = pagy Course.meny_records, items: 5, page_param: :pagy_course

    @user = User.last
  end
end
