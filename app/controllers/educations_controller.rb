# frozen_string_literal: true

class EducationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_variable!, except: %i[new create]

  def new
    @education = @user.educations.build
  end

  def edit; end

  def create
    @education = @user.educations.build education_params

    if @education.save
      redirect_to user_path, success: t('flash.new',
                                        model: flash_locale(@education))
    end

    render :new, status: :unprocessable_entity
  end

  def update
    if @education.update education_params
      redirect_to user_path, success: t('flash.update',
                                        model: flash_locale(@education))
    end

    render :edit, status: :unprocessable_entity
  end

  def destroy
    return unless @education.destroy

    redirect_to user_path, success: t('flash.destroy',
                                      model: flash_locale(@education))
  end

  private

  def find_variable!
    @education = Education.find params[:id]
  end

  def education_params
    params.require(:education).permit(:name_organization, :degree,
                                      :field_of_study, :date_of_end, :locale)
  end
end
