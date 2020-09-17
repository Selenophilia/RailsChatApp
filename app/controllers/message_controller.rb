class MessageController < ApplicationController
    before_action :load_params

    def create
      @room_message = Message.create user: current_user,
                                         room: @chatroom,                                     message_body: params.dig(:message_body, :chatroom_id)
    end
  
    protected
  
    def load_params
      @chatroom = Chatroom.find params.dig(:message_body, :chatroom_id)
    end
end
