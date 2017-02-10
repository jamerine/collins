Rails.application.routes.draw do
  devise_for :users

  root 'welcome#home'
  get 'welcome/home'
  get 'welcome/about'

  resources :accounts

  resources :leads

  namespace :account do
    resources :users, except: :create 

    post 'create_user' => 'users#create', as: :create_user
  end
end
