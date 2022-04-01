Rails.application.routes.draw do
  get 'genres/index'
  get 'genres/show'

  resources :pages, except: [:show]
  get 'pages/:permalink' => "pages#permalink", as: 'permalink'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'home/index'
  get 'publishers/index'
  get 'publishers/show'
  get 'games/index'
  get 'games/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :publishers,only: [:index, :show]
  resources :games,only: [:index, :show]
  resources :genres,only: [:index, :show]
  root "home#index"
end
