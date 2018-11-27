Rails.application.routes.draw do
  get 'ev/index'
  get 'ev/show'
  resources :events
  get 'space/show'
  resources :groups
  resources :facilities, :only => [:index, :show]
  devise_for :users
  get 'home/index'

  namespace :manage do
    get 'home/index'
    resources :facility_categories
    resources :facilities
    resources :spaces
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'home#index'
end
