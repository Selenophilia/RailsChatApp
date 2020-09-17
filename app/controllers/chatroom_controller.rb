class ChatroomController < ApplicationController    
   before_action :load_chat_rooms

    def index
        @chatrooms = Chatroom.all
    end

    def new
        @chatroom = Chatroom.new
    end

    def create
        @chatroom = Chatroom.create(load_params)
        
        if @chatroom.save               
            redirect_to root_path

        else
            render :new
        end 
    end

    def edit
    
    end

    def show 
        @room_message = Message.new chatroom: @chatroom 
        @room_messages = @chatroom.messages.includes(:user)
    
    end

    protected

    def load_chat_rooms
        @chatrooms = Chatroom.all 
        @chatroom = Chatroom.find(params[:id]) if params[:id]
    end

    def load_params
        params.permit(:name)
    end
end
