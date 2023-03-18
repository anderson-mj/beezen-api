Rails.application.routes.draw do
  scope path: 'api' do
    api_guard_routes for: 'users'
  end
  constraints subdomain: 'api' do
    api_guard_routes for: 'users'
  end
  namespace :api do
    resources :alerts, only: [:index, :create]
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "alert#index"
end
