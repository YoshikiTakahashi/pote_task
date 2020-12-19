Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, skip: [:registrations, :sessions]
  as :user do
    get 'sign_up',          to: 'devise/registrations#new', as: :new_user_registration
    post'sign_up',          to: 'devise/registrations#create', as: :user_registration
    get 'users/:id/edit',   to: 'devise/registrations#edit', as: :edit_user_registration
    put 'users/:id/edit',   to: 'devise/registrations#update', as: :update_user_registration
    delete 'users/:id/edit',to: 'devise/registrations#destroy'
    get 'sign_in',          to: 'devise/sessions#new', as: :new_user_session
    post 'sign_in',         to: 'devise/sessions#create', as: :user_session
    match 'sign_out',       to: 'devise/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
  end

  # devise_scope :user do
  #   delete :sign_out, to: 'devise/sessions#destroy', as: :destroy_user_session
  # end

  get "welcome", to: "welcome#index", as: "user_root"

  resources :posts
  get 'posts/index'
  get 'welcome/index'
  root 'landing_page#home'

end
