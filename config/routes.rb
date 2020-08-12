Rails.application.routes.draw do
  devise_for :users
  
  resource :profile
end
