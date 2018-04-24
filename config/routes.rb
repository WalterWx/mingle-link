Rails.application.routes.draw do



  devise_for :users
	resources :events
	get '/events/', to: 'events#index', as: 'main'






  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
