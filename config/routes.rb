Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # get 'categories/:id', to: 'categories#show'
  resources :categories

  get 'search', to: 'search#index'

  # get 'users/profile', to: 'users#profile'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root to: 'articles#home_page'

  get '/u/:id', to: 'users#profile', as: 'user'

  resources :articles do
    resources :comments
  end
end
