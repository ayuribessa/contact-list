Rails.application.routes.draw do
  get 'users' => 'users#index'
  get 'show' => 'users#show'
  get 'new' => 'users#new'
  get 'create' => 'users#create'
  get 'edit' => 'users#edit'
  get 'update' => 'users#update'
  get 'destroy' => 'users#destroy'
  get 'user/:id' => 'users#show', as: :user
  # Defines the root path route ("/")
  root 'users#index'
end
