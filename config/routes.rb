Rails.application.routes.draw do
  resources :addresses do
    collection do
      get :states
    end
  end
  # routes to authentication
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, except: [:new]

  resources :banks do
    resources :bank_agencies, only: %i[index]
    resources :properties, only: %i[index]
  end
  resources :tweets
  root to: 'dashboard#index'
  
  get 'dashboard/index'
  resources :travels, only: [:index]
  # ChatRoom
  get 'chatroom', to: 'chatroom#index'
  post 'message', to: 'messages#create'
  # Hotwire example
  resources :tweets do
    resource :like
    resource :retweet
  end
  
  get '/search' => 'travels#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount ActionCable.server, at: '/cable'
end
