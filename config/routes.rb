Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :restaurants
  devise_for :users

  resource :profile, only: [:show, :edit, :update]

  # resources :subscriptions, only: [] do
  #   resources :user_subscriptions, only: [:create]
  # end

  resources :user_subscriptions, only: [:new, :create, :destroy]

  resources :restaurants

  resources :meals, only: [:index, :show] do
    resources :orders, only: [:create]
  end

  resources :orders, only: [:index, :show, :destroy] do
    member do
      get :confirmation
    end
  end
  get 'guideline', to: "pages#guideline"
end
