class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :define_project!, except: %i[new create]

  def new 
    @project = @user.projects.build
  end

  def create
    @project = @user.projects.build(project_params)
    
    if @project.save
      redirect_to user_path, 
        success: I18n.t('flash.new', model: @project.locale == 'ru' ? 
        i18n_model_name(@project) : i18n_model_name(@project).downcase)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to user_path,
        success: I18n.t('flash.update', model: @project.locale == 'ru' ? 
        i18n_model_name(@project) : i18n_model_name(@project).downcase)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy   
    if @project.destroy
      redirect_to user_path, 
        success: I18n.t('flash.destroy', model: @project.locale == 'ru' ? 
        i18n_model_name(@project) : i18n_model_name(@project).downcase)
    end
  end

  private

    def define_project!
      @project = Project.find(params[:id])
    end
    
    def project_params
      params.require(:project).permit(:title, :site, :github, :description, :locale)#, previews: [])
    end
end
