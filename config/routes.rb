Rails.application.routes.draw do
  devise_for :users
  root "home#top"
  resources :users, only: [:show, :edit, :update, :index]
  resources :books, only: [:show, :edit, :update, :index, :create, :destroy]
  get "home/about",as: "home_about"
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
