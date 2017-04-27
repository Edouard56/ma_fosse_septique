Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'
  resources :users
  resources :clients, only: [ :new, :create, :show ]
  mount Attachinary::Engine => "/attachinary"
  # création de la route formulaire (a faire)
end
