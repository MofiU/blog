Rails.application.routes.draw do
  root 'home#index'

  namespace :home do
    get 'index'
    get 'about'
    get 'contact'
  end

  resources :tags
  resources :articles
  resources :comments

  namespace :admin do
    get 'dashboard', as: :root
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
end
