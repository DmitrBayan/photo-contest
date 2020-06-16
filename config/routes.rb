# frozen_string_literal: true

Rails.application.routes.draw do
  get 'errors/error_404'
  get 'errors/error_505'
  ActiveAdmin.routes(self)
  root 'static_pages#home'
  delete 'logout' => 'session#destroy'
  get '/auth/:provider/callback' => 'session#create'
  resources :users
  resources :posts do
    resources :comments
    resource :likes
  end
  resource :comments do
    resource :comments
  end

  match '*not_found' => 'errors#error_404', via: :all
end
