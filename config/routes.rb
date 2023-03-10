Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  get "/profile", to: "pages#profile"
  get "/profile/account", to: "pages#account"

  resources :planes do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:edit, :destroy] do
    resources :reviews, only: [:new, :create]
    member do
      patch :validate
      patch :deny
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
