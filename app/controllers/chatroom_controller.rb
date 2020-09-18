class ChatroomController < ApplicationController    
   before_action :load_chat_rooms, only: [:show ]

    def index        
        @messages = Message.all
        @message_new = Message.new
    end

   
   
end
