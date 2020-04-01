# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get 'login' => 'users#new'
  delete 'logout' => 'session#destroy'
  get 'view' => 'users#show'
  get '/auth/:provider/callback' => 'session#create'
  resources :users
  resources :posts, only: %i[create destroy] do
    resources :comments
  end
end
