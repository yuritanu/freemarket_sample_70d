Rails.application.routes.draw do
  root to: 'home#index' 
  resources :mypages, only: [:index]
  resources :logouts, only: [:index]
  resources :cards, only: [:index, :new] 
  resources :users do
    collection do
      get 'new2'
      get 'new3'
    end
  end  
  resources :products, only: :new
end
