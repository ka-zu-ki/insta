Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'

  resources :posts, only: [:index, :new, :create] do
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
