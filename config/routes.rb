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
  root to: 'products#index' 
  resources :mypages, only: [:index] do
    collection do
      get 'logout'
      get 'card'
      get 'newcard'
    end
  end
  
  # ↓5/16スプリントレビュー後は削除
  resources :notusers do
    collection do
      get 'new2'
      get 'new3'
    end
  end  
  # ↑5/16スプリントレビュー後は削除

  resources :products, only: [:index, :new, :edit, :show] do
    # 上記のproductsの最後にあるdoも5/16スプリントレビュー後は削除
    # ↓も5/16スプリントレビュー用
    collection do
      get 'testshow'
      get 'testconfirm'
    end
  end

  resources :categories, only: [:new] do
  end
end
