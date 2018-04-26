Rails.application.routes.draw do

	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

	get '/events/:event_id/groups/new', to: 'groups#new', as: 'groups'
	resources :events do
		resources :groups
	end
	get '/events/', to: 'events#index', as: 'main'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
