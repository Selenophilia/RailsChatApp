class ChatroomController < ApplicationController    
    def index
        @messages = Message.all
    end

    def new
        @message = Message.new
    end

    def create
        @message = Message.create(params.permit(:message_body, :user_id))
        byebug
        if @message.save               
            redirect_to '/messages' 

        else

            redirect_to new_message_url    
        end 
    end
end
