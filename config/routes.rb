Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'top#index'
  resources :top, only: [:index]
  # resources :tweets, only: [:index, :new, :create, :destroy, :edit, :update, :show] 下記に省略
  resources :tweets do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show

end
