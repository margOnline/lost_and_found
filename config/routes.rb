Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  match 'users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup

  root 'homepage#index'
  get 'about' => 'homepage#about'
  get 'matching_items/:id' => 'items#matching', as: 'matching_items'

  resources :users, only: [:new, :create]
    resources :items

  resources :items, only:[:index, :show]
  resources :categories, only: [:show]
  resources :tags, only: [:show]

  namespace :admin do
    root to: 'admin#index'

    resources :categories, except: [:show, :edit, :update]
    resources :tags
  end
end

