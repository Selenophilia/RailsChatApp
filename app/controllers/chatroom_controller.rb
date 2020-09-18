class ChatroomController < ApplicationController    
    def index        
        @messages = Message.all
        @message_new = Message.new
    end
end
