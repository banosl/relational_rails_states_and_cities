Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/states', to: 'states#index'
  get '/states/:id', to: 'states#show'
  get '/cities', to: 'cities#index'
  get '/cities/:id', to: 'cities#show'
  get '/states/:state_id/cities', to: 'state_cities#index'
end
