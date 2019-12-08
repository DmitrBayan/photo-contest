Rails.application.routes.draw do
	root 					'static_pages#start'
	get 	'login' 	=> 	'users#login'
	
	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
    resources :users, :only => [:index, :destroy]
	
end
