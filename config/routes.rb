Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resource :profile

  resources :posts do
    resource :like, only: [:show, :create, :destroy]
    resources :comments, only: [:new, :create, :index, :show] do
      collection do
        get 'index_json'
      end
    end
    
  end

end
