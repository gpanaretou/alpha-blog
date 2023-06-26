Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"

  resources :articles
  resources :users, except: [:new]

  get "about", to: "pages#about"
  get "signup", to: "users#new"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :categories, except: [:destroy]



end
