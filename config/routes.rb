Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :suppliers
  resources :commitments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :commitments
end
