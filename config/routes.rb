Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :suppliers
  resources :commitments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :commitments do
    get 'commitment_payment_proceed', to: 'commitments#commitment_payment_proceed'
  end

  resources :commitments do
    get 'commitment_upload', to: 'commitments#commitment_upload'
  end

  resources :commitments do
    get 'commitment_postpone', to: 'commitments#commitment_postpone'
  end

  # get 'download_file/:id', to: 'commitments#download_file', as: 'download_file'
  # get 'download_zip', to: 'commitments#zip', as: 'download_zip'

  get 'pre_closing', to: 'commitments#pre_closing', as: 'pre_closing'
  get 'closing', to: 'commitments#closing', as: 'closing'
  get 'team', to: 'pages#team', as: 'team'

end
