class SkillsController < ApplicationController
  before_action :authenticate_user!
  before_action :define_skill, except: %i[new create index]

  def index
    @skills = Skill.all
  end

  def show
  end

  def new 
     @skill = @user.skills.build
  end

  def create
    @skill = @user.skills.build(skill_params)
    
    if @skill.save
      redirect_to skills_path,
      # redirect_to user_path(@user), 
        success: I18n.t('flash.new', model: @skill.locale == 'ru' ?
        i18n_model_name(@skill) : i18n_model_name(@skill).downcase)
    else
     render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @skill.update(skill_params)
      redirect_to skill_path(@skill),
      # redirect_to user_path(@user), 
      success: I18n.t('flash.update', model: @skill.locale == 'ru' ? 
      i18n_model_name(@skill) : i18n_model_name(@skill).downcase)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy   
    if @skill.destroy
      redirect_to skills_path,
      # redirect_to user_path(@user), 
        success: I18n.t('flash.destroy', model: @skill.locale == 'ru' ? 
        i18n_model_name(@skill) : i18n_model_name(@skill).downcase)
    end
  end

  private

  def define_skill
    @skill = Skill.find(params[:id])
  end
  
  def skill_params
    params.require(:skill).permit(:skillname, :description, :locale)
  end
end
