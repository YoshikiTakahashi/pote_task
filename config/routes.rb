Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # devise_scope :user do
  #   delete :sign_out, to: 'devise/sessions#destroy', as: :destroy_user_session
  # end

  get "welcome", to: "welcome#index", as: "user_root"

  resources :posts
  get 'welcome/index'
  root 'landing_page#home'

end
