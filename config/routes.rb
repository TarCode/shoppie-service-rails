Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :lists, only: %i[index show create destroy]
  resources :items, only: %i[index create destroy]

  resources :users, param: :id

  get '/items/list/:id', to: 'items#items_by_list'
  post '/users/login', to: 'authentication#login'
  post '/users/register', to: 'users#register'
  get '/*a', to: 'application#not_found'
end
