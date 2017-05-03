Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'
  resources :users
  resources :clients, only: [ :new, :create, :show ]
  mount Attachinary::Engine => "/attachinary"

  # routes magazines
  get 'magazine', to: 'articles#index'

    #routes actualite-juridique
    get 'magazine/actualite-juridique/legislation-ce-qui-change-en-2017', to: 'articles#legislation_2017'

  # routes dossiers
  get 'quel-choix-pour-le-particulier-entre-assainissement-individuel-ou-collectif', to: 'articles#choix_assainissement_individuel_ou_collectif'
  get 'de-quoi-se-compose-un-assainissement-individuel-type', to: 'articles#composition_assainissement_individuel'
  get 'quel-est-le-cout-global-d-une-fosse-septique', to: 'articles#cout_fosse_septique'
  get 'quelles-sont-les-principales-contraintes-de-l-assainissement-individuel', to:'articles#contraintes_assainissement_individuel'
  get 'comment-fonctionne-une-fosse-septique', to: 'articles#fonctionnement_fosse_septique'
  get 'comment-fonctionne-l-epandage-souterrain', to: 'articles#fonctionnement_epandage_souterrain'
  get 'comprendre-l-assainissement-individuel', to: 'articles#comprendre_assainissement_individuel'
end
