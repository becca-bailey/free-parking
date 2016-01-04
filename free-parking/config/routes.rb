Rails.application.routes.draw do
  resources :users, except: [:new, :edit]
  resources :groups, except: [:index, :show]
  resources :games do
    resources :reviews, only: [:edit, :new, :destroy]
  end

  devise_for :users

end
