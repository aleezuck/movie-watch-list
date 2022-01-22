Rails.application.routes.draw do
  devise_for :users
  root to: 'lists#index'

  resources :movies, only: [:index]
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:create]
  end

  get '/my_lists', to: 'lists#my_lists', as: :my_lists
end
