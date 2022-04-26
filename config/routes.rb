Rails.application.routes.draw do
  devise_for :users

  root to: "articles#home_page"

  resources :articles do
    resources :comments
  end
end
