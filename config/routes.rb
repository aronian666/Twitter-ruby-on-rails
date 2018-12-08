Rails.application.routes.draw do
  get 'follows/index'
  root 'tweets#index'
  post 'login' => 'sessions#create'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#index'
  resources :users
  resources :tweets do
    resources :comments
  end
  delete 'logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
