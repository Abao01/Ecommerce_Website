Rails.application.routes.draw do
  get 'publishers/index'
  get 'publishers/show'
  get 'games/index'
  get 'games/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
