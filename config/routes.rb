Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join('|')}/ do
    devise_for :users, controllers: { registrations: "users/registrations" }

    devise_scope :user do  
      get 'sign_in', to: 'users/sessions#new'
      get 'sign_up', to: 'users/registrations#new'
      get 'sign_out', to: 'users/sessions#destroy'
    end

    get 'home', to: 'home#index'
    get 'admin', to: 'home#admin'
    get 'user', to: 'users#show'
    root to: 'home#index'

    resources :contacts, only: [:index]
    resources :educations, only: [:index]
    resources :personal_details, only: [:index]
    resources :projects, only: [:index]
    resources :experiences, only: [:index]
    resources :skills, only: [:index]
    resources :courses, only: [:index]

    shallow do    
      resources :users do 
        resources :contacts, except: [:index]
        resources :educations, except: [:index]
        resources :personal_details, except: [:index]
        resources :projects, except: [:index]
        resources :experiences, except: [:index]
        resources :skills, except: [:index]
        resources :courses, except: [:index]
      end
    end
  end
end
