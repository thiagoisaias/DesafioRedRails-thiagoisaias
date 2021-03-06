Rails.application.routes.draw do
  get 'relationships/create'

  get 'relationships/destroy'

  devise_for :users
  
  resources :users, only: [:index, :show] do
    member do
      get :followers, :following
    end
  end

  resources :posts , only: [:new, :destroy, :edit, :update]
  resources :relationships, only: [:create, :destroy]
  root 'static_pages#home'

  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/feed', to: 'static_pages#feed'
  post '/feed', to: 'posts#create'
end
