Rails.application.routes.draw do
  devise_for :users
  get 'my_portfolio', to: 'users#my_portfolio'
  root 'welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
