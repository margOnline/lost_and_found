Rails.application.routes.draw do
  devise_for :users

  root 'homepage#index'
  get 'about' => 'homepage#about'

  resources :users, only: [:new, :create]
    resources :items

  resources :items, only:[:index, :show]

  namespace :admin do
    root to: 'admin#index'

    resources :categories
  end
end
