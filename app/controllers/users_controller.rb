class UsersController < ApplicationController
  def show
   @contact = @user.contacts.build
   @course = @user.courses.build
   @education = @user.educations.build
   @experience = @user.experiences.build
   @personal_detail = @user.personal_details.build
   @project = @user.projects.build
   @skill = @user.skills.build
  end
end
