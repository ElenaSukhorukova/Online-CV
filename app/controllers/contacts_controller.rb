class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :define_contact, except: %i[new create index]

  def index
    @contacts = Contact.all
  end

  def show
  end

  def new
    @contact = @user.contacts.build
  end

  def create
    @contact = @user.contacts.build(contact_params)
    
    if @contact.save
      redirect_to contacts_path, 
        success: I18n.t('flash_plural.new', model: @contact.locale == 'ru' ? 
        i18n_model_name(@contact) : i18n_model_name(@contact).downcase)
      # redirect_to user_path(@user), 
      #   success: I18n.t('flash_plural.new', model: @contact.locale == 'ru' ? 
      #   i18n_model_name(@contact) : i18n_model_name(@contact).downcase)
    else
      render :new, status: :unprocessable_entity
      # redirect_to user_path(@user), danger: "#{@contact.errors.full_messages.each{|error| error.capitalize}.join(' ')}"
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to contact_path(@contact),
      # redirect_to user_path(@user), 
        success: I18n.t('flash_plural.update', model: @contact.locale == 'ru' ? 
        i18n_model_name(@contact) : i18n_model_name(@contact).downcase)
    else
     render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @contact.destroy
      redirect_to contacts_path,
      # redirect_to user_path(@user), 
        success: I18n.t('flash_plural.destroy', model: @contact.locale == 'ru' ? 
        i18n_model_name(@contact) : i18n_model_name(@contact).downcase)
    end
  end

  private

  def define_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:address, :email, :linkedin, :github, :phone, :telegram, :locale)
  end
end
