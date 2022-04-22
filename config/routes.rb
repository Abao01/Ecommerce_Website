Rails.application.routes.draw do

  resources :pages, except: [:show]
  get 'pages/:permalink' => "pages#permalink", as: 'permalink'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :publishers,only: [:index, :show]
  resources :games,only: [:index, :show] do
    collection do
      get 'search'
    end
  end
  resources :genres,only: [:index, :show]
  resources :search,only: [:index, :show]
  root "home#index"

  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end

  resources :cart,only: [:create, :destroy]
  resources :shopping_carts

  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
    get "success", to: "checkout#success", as: "checkout_success"
  end
end
