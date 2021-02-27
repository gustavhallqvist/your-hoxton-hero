Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :tasks do
    resources :bookings, only: [:new, :create]
    resources :task_reviews, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show, :edit, :update, :destroy] do
    resources :booking_reviews, only: [:new, :create]
  end
  resources :booking_reviews, only: [:show, :edit, :update, :destroy]
  resources :task_reviews, only: [:show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
