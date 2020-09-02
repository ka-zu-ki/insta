require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  devise_for :users

  root to: 'posts#index'

  resources :posts do
    resource :like, only: [:show, :create, :destroy]
    resources :comments, only: [:index, :new, :create, :destroy] do
      collection do
        get 'index_json'
      end
      resources :replies, only: [:new, :create]
    end
  end

 

  resource :profile 

  resources :accounts, only: [:show, :index] do
    resources :follows, only: [:show, :create] 
  
    resources :unfollows, only: [:create]

    resources :followingslists, only: [:index]

    resources :followerslists, only: [:index]
  end
end
