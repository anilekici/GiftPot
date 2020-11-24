Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :pots do
    get '/thankyou', to: 'pages#thankyou'
    resources :gifts, only: [:new, :create, :destroy]
    member do

      post 'gifts/:gift_id/upvote', to: 'gifts#upvote', as: 'upvote'
      post 'gifts/:gift_id/downvote', to: 'gifts#downvote', as: 'downvote'
    end
    resources :contributions, only: [:new, :create, :show] do
      resources :payments, only: [:new]
    end
  end
  resources :gifts, only: [:edit, :update, :destroy]

  resources :chatrooms, only: [:show, :index] do
    resources :messages, only: :create
  end
  get '/dashboard', to: 'pages#dashboard'
end
