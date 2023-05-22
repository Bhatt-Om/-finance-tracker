Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  resources :friendships, only: [:destroy]
  devise_for :users
  get 'search_stock', to: 'stocks#search'
  get 'my_portfolio', to: 'users#my_portfolio'
  root 'welcome#index'
  post 'user_stock/stock_id:/user_id:', to: 'user_stocks#destroy', as: 'remove'
  get 'my_friends', to: 'users#my_friends'
  get 'search_friend', to: 'users#search'
  get 'friend', to: 'friendships#index'
  post 'friendship/friend_id:/user_id:', to: 'friendships#create', as: 'folllow'
  get 'user/:user_id', to: 'users#show'
  # delete 'remove_friend', to: 'friendships#destroy', as: 'remove_friend'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
