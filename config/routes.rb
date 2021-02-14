Rails.application.routes.draw do
  root "users#show"
  devise_for :users, path:"",path_names:{sign_up: "register",sign_in: "login",sign_out: "logout"}
  resources :users
  get "/search/:q",to:"users#index"
  resources :friendships
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
