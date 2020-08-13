Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resource :profile

  resources :posts do
    resource :like, only: [:show, :create, :destroy]
  end
end
