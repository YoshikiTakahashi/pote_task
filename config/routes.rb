Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'}
    get 'sign_in',          to: 'devise/sessions#new'
    post 'sign_in',         to: 'devise/sessions#create'
    match 'sign_out',       to: 'devise/sessions#destroy', via: Devise.mappings[:user].sign_out_via

  resources :users, only: [:index, :show, :edit, :update, :destroy] 
  resources :photos, only: [:new, :index, :show, :create, :destroy]
  root 'landing_page#home'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
end
