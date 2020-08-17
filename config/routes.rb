Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'

  resources :posts do
    resource :like, only: [:show, :create, :destroy]
    resources :comments, only: [:new, :create, :index, :show] do
      collection do
        get 'index_json'
      end
    end
  end

  resource :profile

  resources :accounts, only: [:show] do
    resources :follows, only: [:show, :create]
    resources :unfollows, only: [:show, :create]
  end
end
