Rails.application.routes.draw do
  root to: 'home#index'  
  resources :users do
    collection do
      get 'new2'
      get 'new3'
    end
  end
  resources :products, only: [:new, :edit]
end
