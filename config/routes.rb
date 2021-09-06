Rails.application.routes.draw do
  root to: 'dashboard#index'
  
  get 'dashboard/index'
  resources :travels, only: [:index]
  # ChatRoom
  get 'chatroom', to: 'chatroom#index'
  post 'message', to: 'messages#create'
  
  get '/search' => 'travels#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount ActionCable.server, at: '/cable'
end
