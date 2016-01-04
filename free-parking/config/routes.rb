Rails.application.routes.draw do
  resources :users
  resources :groups, except: [:index, :show]
  resources :games do
    resources :reviews, only: [:edit, :new, :destroy]
  end

  devise_for :users

end
