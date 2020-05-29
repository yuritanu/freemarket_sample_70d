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
   
  resources :mypages, only: [:index] do
    collection do
      get 'logout'
      get 'card'
      get 'newcard'
    end
  end

  resources :products, only: [:index, :new, :edit, :show]
end
