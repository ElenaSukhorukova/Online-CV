class ExperiencesController < ApplicationController
  before_action :authenticate_user!
  before_action :define_experience!, except: %i[new create]
  
  def new 
    @experience = @user.experiences.build
  end

  def create
    @experience = @user.experiences.build experience_params
   
    if @experience.save
      redirect_to user_path, 
        success: I18n.t('flash.new', model: @experience.locale == 'ru' ? 
        i18n_model_name(@experience) : i18n_model_name(@experience).downcase)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @experience.update experience_params
      redirect_to user_path,
        success: I18n.t('flash.update', model: @experience.locale == 'ru' ? 
        i18n_model_name(@experience) : i18n_model_name(@experience).downcase)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy   
    if @experience.destroy
      redirect_to user_path, 
        success: I18n.t('flash.destroy', model: @experience.locale == 'ru' ? 
        i18n_model_name(@experience) : i18n_model_name(@experience).downcase)
    end
  end

  private

    def define_experience!
      @experience = Experience.find params[:id]
    end
    
    def experience_params
      params.require(:experience).permit(:employer, :position, :date_of_begin, :date_of_end, :description, :locale)
    end
end
