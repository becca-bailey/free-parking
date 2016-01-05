Rails.application.routes.draw do
  root "games#index"
  resources :users
  resources :sessions, only: [:create]
  get "/login" => "sessions#new", as: "login"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy", as: "logout"
  get "groupings/new" => "groupings#new", as: "new_grouping"
  post "groupings" => "groupings#create"

  resources :groups, except: [:index] do
    resources :invites
  end

  resources :games do
    resources :reviews, except: [:index, :show]
  end

end
