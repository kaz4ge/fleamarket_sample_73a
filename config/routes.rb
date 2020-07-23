Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'
  resources :users, only: :show
  resources :credit_cards, only: [:new, :create, :show, :destroy] 
  resources :products, only: [:index, :new, :show] do
    resources :credit_cards do
      member do
        get "buy"
        post "pay"
      end
    end
  end
end
