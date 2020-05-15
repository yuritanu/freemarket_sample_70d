Rails.application.routes.draw do 
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions',
  #   registrations: 'users/registrations'
  # }
  # devise_scope :user do
  #   get  'profileaddresses', to: 'users/registrations#new_profileaddresses'
  #   post 'profileaddresses', to: 'users/registrations#create_profileaddresses'
  #   get  'deliveryaddresses',to: 'users/registrations#new_deliveryaddresses'
  #   post 'deliveryaddresses', to: 'users/registrations#create_deliveryaddresses'

  # end
  root to: 'home#index' 
  # resources :users do
  #   collection do
  #     get 'new2'
  #     get 'new3'
  #   end
  # end  
  resources :products, only: :new
end
