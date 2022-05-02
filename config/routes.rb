Rails.application.routes.draw do
  get 'search', to: 'search#index'
  # get 'users/profile', to: 'users#profile'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root to: 'articles#home_page'

  get '/u/:id', to: 'users#profile', as: 'user'

  resources :articles do
    resources :comments
  end
end
