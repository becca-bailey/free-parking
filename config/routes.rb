Rails.application.routes.draw do
  root "games#index"
  resources :users

  resources :sessions, only: [:create]
  get "/login" => "sessions#new", as: "login"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy", as: "logout"
  post "/users/games/:id" => "users#add_game", as: "add_game"
  delete "/users/games/:id" => "users#remove_game", as: "delete_game"
  get "/invites/accept" => "invites#accept"
  post "/groups/:group_id/invites/:id" => "invites#join", as: "join_group"
  delete "/groupings/:id" => "groupings#destroy", as: "delete_grouping"
  resources :groups, except: [:index] do
    resources :invites
  end

  resources :games do
    resources :reviews, except: [:index, :show]
  end

end
