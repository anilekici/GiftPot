Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pots, except: [:destroy] do
    resources :gifts, only: [:new, :create, :index, :destroy]
  end
  resources :gifts, only: [:edit, :update]

  get '/dashboard', to: 'pages#dashboard'
end
