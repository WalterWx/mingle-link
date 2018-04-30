Rails.application.routes.draw do
    get '/', to: 'users#homepage'
	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}

	resources :users, only: [:index]

	get '/events/:event_id/groups/new', to: 'groups#new', as: 'groups'
	resources :events do
		resources :groups
	end
	get '/events/', to: 'events#index', as: 'main'
    get '/:event_id', to: 'events#show'
    post '/:event_id/:id', to: 'groups#join_group'
    delete '/:event_id/:id', to: 'groups#leave_group'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
