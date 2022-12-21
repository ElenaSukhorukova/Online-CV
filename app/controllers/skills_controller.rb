class SkillsController < ApplicationController
  before_action :authenticate_user!
  before_action :define_skill!, except: %i[new create]

  def new
    @skill = @user.skills.build
  end

  def edit; end

  def create
    @skill = @user.skills.build(skill_params)

    if @skill.save
      redirect_to user_path,
                  success: I18n.t('flash.new', model: if @skill.locale == 'ru'
                                                        i18n_model_name(@skill)
                                                      else
                                                        i18n_model_name(@skill).downcase
                                                      end)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @skill.update(skill_params)
      redirect_to user_path,
                  success: I18n.t('flash.update', model: if @skill.locale == 'ru'
                                                           i18n_model_name(@skill)
                                                         else
                                                           i18n_model_name(@skill).downcase
                                                         end)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    return unless @skill.destroy

    redirect_to user_path,
                success: I18n.t('flash.destroy', model: if @skill.locale == 'ru'
                                                          i18n_model_name(@skill)
                                                        else
                                                          i18n_model_name(@skill).downcase
                                                        end)
  end

  private

  def define_skill!
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:skillname, :description, :locale)
  end
end
