Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'}
  # as :user do
    # get 'sign_up',          to: 'devise/registrations#new', as: :new_user_registration
    # post'sign_up',          to: 'devise/registrations#create', as: :user_registration
    # get 'users/:id/edit',   to: 'devise/registrations#edit', as: :edit_user_registration
    # put 'users/:id/edit',   to: 'devise/registrations#update', as: :update_user_registration
    # delete 'users/:id/edit',to: 'devise/registrations#destroy'
    get 'sign_in',          to: 'devise/sessions#new'
    post 'sign_in',         to: 'devise/sessions#create'
    match 'sign_out',       to: 'devise/sessions#destroy', via: Devise.mappings[:user].sign_out_via
    # get 'sign_in',          to: 'devise/sessions#new', as: :new_user_session
    # post 'sign_in',         to: 'devise/sessions#create', as: :user_session
    # match 'sign_out',       to: 'devise/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
  # end

  resources :users, only: [:show] do
  end

  resources :photos, only: [:index, :show, :create, :destroy]

  root 'landing_page#home'

end
