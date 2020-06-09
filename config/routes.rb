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
   
  # マイページ関係
  resources :mypages, only: [:show] do
    member do
      get 'logout'
      get 'card'
    end
  end

  # クレジットカード関係
  resources :creditcards, only: [:new, :create, :destroy]

  # 商品関係
  resources :products do
    member do
      get  :buy
      post :buy
    end
  end

  # カテゴリー関係
  resources :categories, only: [:new]
  
end
