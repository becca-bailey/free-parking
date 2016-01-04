Rails.application.routes.draw do
    resources :users
    resources :sessions, only: [:create]
    get "/login" => "sessions#new", as: "login"
    delete "/logout" => "sessions#destroy", as: "logout"

    resources :groups, except: [:index]
    resources :games do
      resources :reviews, except: [:index, :show]
  end
end
