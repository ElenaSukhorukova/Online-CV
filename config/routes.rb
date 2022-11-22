Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'

  devise_for :users, controllers: { 
    registrations: "users/registrations",
  }

  devise_scope :user do  
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_up', to: 'users/registrations#new'
    get 'sign_out', to: 'users/sessions#destroy'
    resources :users, only: [:show]
  end

  shallow do    
    resources :users do 
      resources :contacts, except: [:show, :index]
      resources :educations, except: [:show, :index]
      resources :personal_data, except: [:show, :index]
      resources :projects, except: [:show, :index]
      resources :experiences, except: [:show, :index]
      resources :skills, except: [:show, :index]
      resources :courses, except: [:show, :index]
    end
  end
end
