Rails.application.routes.draw do
  root "games#index"
  resources :users
  resources :sessions, only: [:create]
  get "/login" => "sessions#new", as: "login"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy", as: "logout"
  get "/invites/accept" => "invites#accept"
  post "/groups/:group_id/invites/:id" => "invites#join", as: "join_group"
  resources :groups, except: [:index] do
    resources :invites
  end

  resources :games do
    resources :reviews, except: [:index, :show]
  end

end
