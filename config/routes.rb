Rails.application.routes.draw do
  resources :translations, only: [:new, :create, :show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "translations#new"
end

