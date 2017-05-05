Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [ :index, :show ]
  resources :clients, only: [ :new, :create, :show ]
  mount Attachinary::Engine => "/attachinary"

  resources :magazine, only: [ :index ] do
    get 'actualite-juridique', on: :collection, controller: "actualites_juridiques", action: "home_actualite_juridique"
    get 'actualite-juridique/legislation', on: :collection, controller: "actualites_juridiques", action: "legislation"
  end


  # Partie guides
  get 'guides', to: 'articles#index'

  # La fosse septique
  get 'quel-choix-pour-le-particulier-entre-assainissement-individuel-ou-collectif', to: 'articles#choix_assainissement_individuel_ou_collectif'
  get 'de-quoi-se-compose-un-assainissement-individuel-type', to: 'articles#composition_assainissement_individuel'
  get 'quel-est-le-cout-global-d-une-fosse-septique', to: 'articles#cout_fosse_septique'
  get 'quelles-sont-les-principales-contraintes-de-l-assainissement-individuel', to:'articles#contraintes_assainissement_individuel'
  get 'comment-fonctionne-une-fosse-septique', to: 'articles#fonctionnement_fosse_septique'
  get 'comment-fonctionne-l-epandage-souterrain', to: 'articles#fonctionnement_epandage_souterrain'
  get 'comprendre-l-assainissement-individuel', to: 'articles#comprendre_assainissement_individuel'


end
