Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get '/todos', to: 'todos#index' # Get all instances 
  # get 'todos/:id', to: 'todos#show' # Get AN instance 
  # post '/todos', to: 'todos#create'
  # put '/todos/:id', to: 'todo#update'
  # patch '/todos/:id', to: 'todo#update'
  # delete '/todos/:id', to: 'todo#destroy'

  resources :todos, {:only => [:index, :show, :create, :destroy, :update]}# the same as above ^^
  
  # patch 'todos/:id', to: "todos#patch" -> custom route that will hit the patch method in the Todos controller.
end
