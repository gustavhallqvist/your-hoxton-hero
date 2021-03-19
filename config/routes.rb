Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  devise_for :users
  root to: 'pages#home'
  resources :tasks do
    resources :bookings, only: [:new, :create]
    resources :task_reviews, only: [:new, :create]
    collection do
      get 'dashboard'
    end
  end
  resources :bookings, only: [:index, :show, :edit, :update, :destroy] do
    resources :booking_reviews, only: [:new, :create]
  end
  resources :booking_reviews, only: [:show, :edit, :update, :destroy]
  resources :task_reviews, only: [:index, :show, :edit, :update, :destroy]

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  resources :users, only: :show

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  resources :donations, only: :index

  resources :nondonations, only: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
