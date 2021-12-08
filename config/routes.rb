Rails.application.routes.draw do
  devise_for :users
  resources :friands
  get 'home/about'
 #root 'home#inidex'
root 'friands#index'
end
