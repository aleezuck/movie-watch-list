Rails.application.routes.draw do
  devise_for :users
  root to: 'lists#index'

  resources :movies, only: [:index]
  resources :lists, only: [:index, :show, :new, :create]
end
