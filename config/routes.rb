Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :suppliers
  resources :users, only: [ :index ]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :organizations do
    resources :users, only: [ :new, :create ]
  end

  resources :commitments do
    get 'commitment_payment_proceed', to: 'commitments#commitment_payment_proceed'
    get 'commitment_postpone', to: 'commitments#commitment_postpone'
    get 'commitment_edit', to: 'commitments#commitment_index'
    get 'commitment_mark_as_paid', to: 'commitments#mark_as_paid'
  end
  get 'dashboard', to: 'pages#dashboard'

  # get 'download_file/:id', to: 'commitments#download_file', as: 'download_file'
  # get 'download_zip', to: 'commitments#zip', as: 'download_zip'

  get 'pre_closing', to: 'commitments#pre_closing', as: 'pre_closing'
  get 'closing', to: 'commitments#closing', as: 'closing'
  resources :closings, only: :create

end
