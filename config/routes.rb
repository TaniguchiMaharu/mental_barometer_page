Rails.application.routes.draw do
  get 'blogs/index'
  get 'calendermemo/index'
  get 'posts/new'
  devise_for :users
  # get 'home/top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#top'
end
