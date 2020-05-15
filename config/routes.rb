Rails.application.routes.draw do
  root to: 'home#index' 
  resources :mypages, only: [:index]
  # resources :mypages, only: [:show] マイページのルーティングは一旦indexにしています。ログイン機能実装後showに変更予定
  resources :logouts, only: [:index]
  # resources :logouts, only: [:destroy] ログアウトページのルーティングは一旦indexにしています。ログイン機能実装後destroyに変更予定
  resources :cards, only: [:index, :new] 
  resources :users do
    collection do
      get 'new2'
      get 'new3'
    end
  end
  resources :products, only: [:new, :edit]
end
