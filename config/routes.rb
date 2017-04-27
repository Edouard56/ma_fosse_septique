Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users

  root to: 'pages#home'

  # creation de l'instance client (create) + message (show)
  resources :clients, only: [ :new, :create, :show ]

  # En tant que pro visiteur (user),
  # je peux crud un user
  resources :users, only: [ :index, :show ]

  mount Attachinary::Engine => "/attachinary"
  # création de la route formulaire (a faire)

end
