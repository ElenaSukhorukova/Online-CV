# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    devise_for :users, controllers: { registrations: 'users/registrations' }

    devise_scope :user do
      get 'sign_in', to: 'devise/sessions#new'
      get 'sign_up', to: 'users/registrations#new'
      get 'sign_out', to: 'devise/sessions#destroy'
    end

    get 'home', to: 'home#index'
    get 'admin', to: 'home#admin'
    get 'user', to: 'users#show'
    root to: 'home#index'

    shallow do
      resources :users do
        resources :contacts, except: %i[index show]
        resources :educations, except: %i[index show]
        resources :personal_details, except: %i[index show]
        resources :projects, except: %i[index show]
        resources :experiences, except: %i[index show]
        resources :skills, except: %i[index show]
        resources :courses, except: %i[index show]
      end
    end
  end
end
