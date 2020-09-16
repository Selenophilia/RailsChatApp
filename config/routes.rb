Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'users/messages', to: 'message#index'
  get 'users/:user_id/messages/new' => 'message#new', as: 'new_message'
  post 'users/:user_id/messages/messages'    => 'message#create', as: 'create_message'

end
