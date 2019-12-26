Rails.application.routes.draw do
  get 'users/login'
	root 'static_pages#start'
	get 'login' => 'users#login'
	get 'view'  => 'users#view'
	get '/auth/:provider/callback' => 'session#create'
end
