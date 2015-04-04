SampleApp::Application.routes.draw do
  root to: 'static_pages#home'
  resources :users do
    member do
      get :following, :followers
    end
    collection do
      get :tigers
    end    
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts do
    resources :comments
  end
  resources :relationships, only: [:create, :destroy]
  resources :password_resets do
    get 'new', on: :collection
  end
  resources :mail_boxs, only: [:index, :show, :create, :destroy] do
    member do
      get  :send_email
      post :create_email
    end    
  end
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/messages', to: 'users#messages', via: 'get'
end
