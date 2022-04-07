Rails.application.routes.draw do

  resources :pages, except: [:show]
  get 'pages/:permalink' => "pages#permalink", as: 'permalink'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :publishers,only: [:index, :show]
  resources :games,only: [:index, :show] do
    collection do
      get 'search'
    end
  end4
  resources :genres,only: [:index, :show]
  resources :search,only: [:index, :show]
  root "home#index"

end
