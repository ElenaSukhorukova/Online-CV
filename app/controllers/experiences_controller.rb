# frozen_string_literal: true

class ExperiencesController < ApplicationController
  before_action :authenticate_user!
  before_action :define_experience!, except: %i[new create]

  def new
    @experience = @user.experiences.build
  end

  def edit; end

  def create
    @experience = @user.experiences.build experience_params

    if @experience.save
      redirect_to user_path, success: t('flash.new',
                                      model: flash_locale(@experience))
    end

    render :new, status: :unprocessable_entity
  end

  def update
    if @experience.update experience_params
      redirect_to user_path, success: t('flash.update',
                                        model: flash_locale(@experience))
    end

    render :edit, status: :unprocessable_entity
  end

  def destroy
    return unless @experience.destroy

    redirect_to user_path, success: t('flash.destroy',
                                      model: flash_locale(@experience))
  end

  private

  def define_experience!
    @experience = Experience.find params[:id]
  end

  def experience_params
    params.require(:experience).permit(:employer, :position, :date_of_begin,
                                       :date_of_end, :description, :locale)
  end
end
