Rails.application.routes.draw do
  resources :posts
  get 'welcome/index'
  root 'landing_page#home'

end
