# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :define_contact!, except: %i[new create]

  def new
    @contact = @user.contacts.build
  end

  def edit; end

  def create
    @contact = @user.contacts.build contact_params

    if @contact.save
      return redirect_to user_path, success: t('flash_plural.new',
                                              model: flash_locale(@contact))
    end

    render :new, status: :unprocessable_entity
  end

  def update
    if @contact.update contact_params
      return redirect_to user_path, success: t('flash_plural.update',
                                                model: flash_locale(@contact))
    end

    render :edit, status: :unprocessable_entity
  end

  def destroy
    return unless @contact.destroy

    redirect_to user_path, success: t('flash_plural.destroy',
                                     model: flash_locale(@contact))
  end

  private

  def define_contact!
    @contact = Contact.find params[:id]
  end

  def contact_params
    params.require(:contact).permit(:address, :email, :linkedin, :github,
                                    :phone, :telegram, :locale)
  end
end
