Rails.application.routes.draw do
  #namespace :api do
  #  api_guard_routes for: 'users'
  #end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "alert#index"
end
