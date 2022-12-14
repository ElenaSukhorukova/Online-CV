class EducationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_variable!, except: %i[new create]

  def new
    @education = @user.educations.build
  end
  
  def create
    @education = @user.educations.build education_params
    
    if @education.save
      redirect_to user_path, 
        success: I18n.t('flash.new',  model: @education.locale == 'ru' ? 
        i18n_model_name(@education) : i18n_model_name(@education).downcase)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @education.update education_params
      redirect_to user_path, 
        success: I18n.t('flash.update', model: @education.locale == 'ru' ? 
        i18n_model_name(@education) : i18n_model_name(@education).downcase)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy   
    if @education.destroy
      redirect_to user_path,  
        success: I18n.t('flash.destroy',  model: @education.locale == 'ru' ? 
        i18n_model_name(@education) : i18n_model_name(@education).downcase)
    end
  end

  private

    def find_variable!
      @education = Education.find params[:id]
      @user = User.first
    end
    
    def education_params
      params.require(:education).permit(:name_organization, :degree, :field_of_study, :date_of_end, :locale)
    end
end
