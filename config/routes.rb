# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/login'
  root 'static_pages#home'
  get 'login' => 'users#new'
  delete 'logout' => 'session#destroy'
  get 'view' => 'users#show'
  get 'users' => 'users#index'
  get '/auth/:provider/callback' => 'session#create'
  resources :users
  resources :posts, only: [:create, :destroy]
end
