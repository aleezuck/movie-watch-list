Rails.application.routes.draw do
  devise_for :users
  root to: 'lists#index'

  resources :movies, only: [:index]
  resources :lists, only: [:index, :show, :new, :create]

  get '/my_lists', to: 'lists#my_lists', as: :my_lists
end
