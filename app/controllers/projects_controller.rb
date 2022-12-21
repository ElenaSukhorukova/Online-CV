# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :define_project!, except: %i[new create]

  def new
    @project = @user.projects.build
  end

  def edit; end

  def create
    @project = @user.projects.build(project_params)

    if @project.save
      redirect_to user_path,
                  success: I18n.t('flash.new', model: if @project.locale == 'ru'
                                                        i18n_model_name(@project)
                                                      else
                                                        i18n_model_name(@project).downcase
                                                      end)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      redirect_to user_path,
                  success: I18n.t('flash.update', model: if @project.locale == 'ru'
                                                           i18n_model_name(@project)
                                                         else
                                                           i18n_model_name(@project).downcase
                                                         end)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    return unless @project.destroy

    redirect_to user_path,
                success: I18n.t('flash.destroy', model: if @project.locale == 'ru'
                                                          i18n_model_name(@project)
                                                        else
                                                          i18n_model_name(@project).downcase
                                                        end)
  end

  private

  def define_project!
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :site, :github, :description, :locale) # , previews: [])
  end
end
