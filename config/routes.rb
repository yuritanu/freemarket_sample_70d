Rails.application.routes.draw do
  root to: 'mypages#index'
  resources :mypages, only: [:index]
  resources :logouts, only: [:index]
  resources :cards, only: [:index, :new]
end
