Rails.application.routes.draw do
  root 'landing_page#home'
  get '/tos',       to: 'landing_page#tos'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations', sessions: 'users/sessions'}
  devise_scope :user do
    get 'pass_edit', to: 'users/registrations#pass_edit', as: 'pass_edit'
    patch 'pass_update', to: 'users/registrations#pass_update', as: 'pass_update'
  end
  resources :users, only: [:index, :show, :edit, :update, :destroy] 
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :photos, only: [:new, :index, :show, :create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
