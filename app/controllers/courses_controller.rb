# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :define_course!, except: %i[new create]

  def new
    @course = @user.courses.build
  end

  def edit; end

  def create
    @course = @user.courses.build course_params

    if @course.save
      redirect_to user_path, success: t('flash.new',
                                        model: flash_locale(@course))
    end

    render :new, status: :unprocessable_entity
  end

  def update
    if @course.update course_params
      redirect_to user_path, success: t('flash.update',
                                      model: flash_locale(@course))
    end

    render :edit, status: :unprocessable_entity
  end

  def destroy
    return unless @course.destroy

    redirect_to user_path, success: t('flash.destroy',
                                      model: flash_locale(@course))
  end

  private

  def define_course!
    @course = Course.find params[:id]
  end

  def course_params
    params.require(:course).permit(:coursename, :description, :date_of_end, :locale)
  end
end

