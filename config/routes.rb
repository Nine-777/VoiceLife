Rails.application.routes.draw do
  devise_for :users
  # 以下を追加
  post '/home/guest_sign_in', to: 'home#guest_sign_in'
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  get "users/:id/likes" => "users#likes"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "signup" => "users#new"
  resources :users
  resources :posts
  root "home#index"
  get "about" => "home#about"
end
