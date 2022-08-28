Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :lists, only: %i[index create destroy]
  resources :items, only: %i[index create destroy]

  resources :users, param: :_username

  get '/items/list/:id', to: 'items#items_by_list'
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
