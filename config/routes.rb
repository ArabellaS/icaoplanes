Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  get "/profile", to: "pages#profile"

  resources :planes do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:edit, :destroy] do
    member do
      patch :validate
      patch :deny
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
