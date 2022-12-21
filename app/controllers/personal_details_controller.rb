# frozen_string_literal: true

class PersonalDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :define_personal_detail!, except: %i[new create]
  after_action :chenge_full_name, only: %i[create update]

  def new
    @personal_detail = @user.personal_details.build
  end

  def edit; end

  def create
    @personal_detail = @user.personal_details.build personal_detail_params

    if @personal_detail.save
      redirect_to user_path,
                  success: I18n.t('flash_plural.new', model: if @personal_detail.locale == 'ru'
                                                               i18n_model_name(@personal_detail)
                                                             else
                                                               i18n_model_name(@personal_detail).downcase
                                                             end)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @personal_detail.update personal_detail_params
      redirect_to user_path,
                  success: I18n.t('flash_plural.update', model: if @personal_detail.locale == 'ru'
                                                                  i18n_model_name(@personal_detail)
                                                                else
                                                                  i18n_model_name(@personal_detail).downcase
                                                                end)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    return unless @personal_detail.destroy

    redirect_to user_path,
                success: I18n.t('flash_plural.destroy', model: if @personal_detail.locale == 'ru'
                                                                 i18n_model_name(@personal_detail)
                                                               else
                                                                 i18n_model_name(@personal_detail).downcase
                                                               end)
  end

  private

  def define_personal_detail!
    @personal_detail = PersonalDetail.find params[:id]
  end

  def personal_detail_params
    params.require(:personal_detail).permit(:photo, :full_name, :position, :about, :locale)
  end
end
