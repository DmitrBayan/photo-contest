# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/login'
  root 'static_pages#home'
  get 'login' => 'users#login'
  get 'view'  => 'users#view'
  get '/auth/:provider/callback' => 'session#create'
  delete 'logout' => 'session#destroy'
end
