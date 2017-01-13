Rails.application.routes.draw do
  devise_for :users
  root 'welcome#home'
  get 'welcome/home'
  get 'welcome/about'

  resources :accounts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
