Rails.application.routes.draw do 
  root to: 'products#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get  '/profileaddresses', to: 'users/registrations#new_profileaddresses'
    post '/profileaddresses', to: 'users/registrations#create_profileaddresses'
    get  '/deliveryaddresses',to: 'users/registrations#new_deliveryaddresses'
    post '/deliveryaddresses', to: 'users/registrations#create_deliveryaddresses'
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
