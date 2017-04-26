Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'

  # creation de l'instance client (create) + message (show)
  resources :clients, only: [ :new, :create, :show ]

  resources :users, only: [ :index, :show ]


  # création de la route formulaire (a faire)

end
