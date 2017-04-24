Rails.application.routes.draw do

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  get 'new', to: 'clients#new'
  post 'create', to: 'clients#create'

end
