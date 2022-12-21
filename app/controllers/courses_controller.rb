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
      redirect_to user_path,
                  success: I18n.t('flash.new', model: if @course.locale == 'ru'
                                                        i18n_model_name(@course)
                                                      else
                                                        i18n_model_name(@course).downcase
                                                      end)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @course.update course_params
      redirect_to user_path,
                  success: I18n.t('flash.update', model: if @course.locale == 'ru'
                                                           i18n_model_name(@course)
                                                         else
                                                           i18n_model_name(@course).downcase
                                                         end)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    return unless @course.destroy

    redirect_to user_path,
                success: I18n.t('flash.destroy', model: if @course.locale == 'ru'
                                                          i18n_model_name(@course)
                                                        else
                                                          i18n_model_name(@course).downcase
                                                        end)
  end

  private

  def define_course!
    @course = Course.find params[:id]
  end

  def course_params
    params.require(:course).permit(:coursename, :description, :date_of_end, :locale)
  end
end
