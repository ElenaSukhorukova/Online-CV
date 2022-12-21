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
                  success: I18n.t('flash.new',
                                  model: flash_locale(@project))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      redirect_to user_path,
                  success: I18n.t('flash.update',
                                  model: flash_locale(@project))
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    return unless @project.destroy

    redirect_to user_path,
                success: I18n.t('flash.destroy',
                                model: flash_locale(@project))
  end

  private

  def define_project!
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :site, :github,
                                    :description, :locale)
  end
end
