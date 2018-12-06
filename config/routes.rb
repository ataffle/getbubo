Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :suppliers
  resources :commitments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :commitments

  get 'download_file/:id', to: 'commitments#download_file', as: 'download_file'
  get 'pre_closing', to: 'commitments#pre_closing', as: 'pre_closing'
  get 'closing', to: 'commitments#closing', as: 'closing'
end
