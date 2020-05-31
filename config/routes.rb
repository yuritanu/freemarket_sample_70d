Rails.application.routes.draw do 
  root to: 'products#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  devise_scope :user do
    post  '/profileaddresses', to: 'users/registrations#new_profileaddresses'
    post  '/deliveryaddresses',to: 'users/registrations#new_deliveryaddresses'
  end
   
  resources :mypages, only: [:show] do
    member do
      get 'logout'
      get 'card'
    end
  end
  resources :creditcards, only: [:new, :create, :destroy]

  resources :products, only: [:index, :new, :edit, :show] do
    member do
      get  :buy
      post :buy
    end
  end
end
