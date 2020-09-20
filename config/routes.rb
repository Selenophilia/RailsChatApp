Rails.application.routes.draw do
  devise_for :users, controllers: {
       sessions: 'users/sessions', 
       registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root controller: :chatroom, action: :index
  get '/messages' =>'chatroom#index', as: 'messages_index'
  
  post '/messages'    => 'messages#create', as: 'messages'
  get 'messages/t/:conversation_id' => 'messages#show', as: 'messages_show'

  post '/conversations' => 'conversation#create', as: 'create_conversation_messages'


  # resources :conversations do
  #   resources :messages
  #  end

end
