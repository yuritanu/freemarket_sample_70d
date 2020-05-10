Rails.application.routes.draw do
  root "home#index"
  get 'testshowing', to: 'producttests#index'
  
end
