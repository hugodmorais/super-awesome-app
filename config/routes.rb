Rails.application.routes.draw do
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
