Rails.application.routes.draw do
  resources :blogs
  get 'calendermemo/index'
  get 'posts/new'
  devise_for :users
  # get 'home/top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#top'
end
