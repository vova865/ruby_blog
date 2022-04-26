Rails.application.routes.draw do

  root to: "articles#home_page"

  resource :session, only: [:new, :create, :destroy ]
  resources :users, only: [:new, :create]

  resources :articles do
    resources :comments
  end
end
