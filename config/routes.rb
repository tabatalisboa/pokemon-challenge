Rails.application.routes.draw do
  devise_for :users

  resources :profiles, only: [:new, :create]
  resources :dashboards, only: :index
  resources :teams, only: [:new, :create]
  resources :pokemons, only: [:show, :new, :create]

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
