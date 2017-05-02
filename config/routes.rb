Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'
  resources :users
  resources :clients, only: [ :new, :create, :show ]
  mount Attachinary::Engine => "/attachinary"

  # routes articles
  get 'quel-choix-pour-le-particulier-entre-assainissement-individuel-ou-collectif', to: 'articles#choix_assainissement_individuel_ou_collectif'

end
