# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  delete 'logout' => 'session#destroy'
  get '/auth/:provider/callback' => 'session#create'
  resources :users
  resources :posts, only: %i[create destroy] do
    resources :comments
  end

  match '*path' => 'errors#error_404', via: :all
end
