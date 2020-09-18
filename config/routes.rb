Rails.application.routes.draw do
  devise_for :users, controllers: {
       sessions: 'users/sessions', 
       registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root controller: :chatroom, action: :index


  get '/chatroom/new' => 'chatroom#new', as: 'new_chatroom'
  post '/chatroom'    => 'chatroom#create', as: 'create_chatroom'
  get  '/chatroom/:id' => 'chatroom#show', as: 'show_chatroom'
  get '/chatroom/:id/edit' => 'chatroom#edit', as: 'edit_chatroom'
  patch '/chatroom/:id'   => 'chatroom#update', as: 'update_chatroom'
  delete '/chatroom/:id' => 'chatroom#destroy', as: 'delete_chatroom'


  post '/messages'    => 'messages#create', as: 'messages'
  
  #resources :chatroom  
  #resources :messages

end
