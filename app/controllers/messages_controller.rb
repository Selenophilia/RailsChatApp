class MessagesController < ApplicationController
    before_action :load_chat_rooms, only: [:create]

    def create
      @chatroom_message = Message.create( user: current_user,                               
                                          chatroom: load_chat_rooms,        
                                          message_body: params.dig(:message, :message_body))
    end

    protected
    def load_chat_rooms
      Chatroom.find(params.dig(:message, :chatroom_id))
    end 

end
