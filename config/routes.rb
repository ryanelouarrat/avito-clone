Rails.application.routes.draw do
  # For annonces
  resources :annonces

  # For user sign-up / sign-in
  resources :utilisateurs, only: [:new, :create, :show] 
  # or resources :utilisateurs  # if you want full CRUD

  # Session routes for login/logout
  get  'login',  to: 'sessions#new'
  post 'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Root route (home page)
  root 'annonces#index'
end
