class MessagesController < ApplicationController
   before_action :load_params, only: [ :create, :show ]

  def create
    #byebug
    @message = current_user.messages.create(user: current_user, 
                                            conversation_id: params.dig(:message, :conversation_id),
                                            message_body:  params.dig(:message, :message_body))
    if @message.save
         ActionCable.server.broadcast "chatroom_channel",
                                        mod_message: message_render(@message)
    else
      flash.now[:alert] = 'error while creating message'
      redirect_to messages_show_path
    end
  end

  def show
    #byebug
    @message_new    = Message.new
    @messages = @conversation.messages
  end


  private
  def message_render(message)
        render(partial: 'message', locals: {message: message})
  end

  def load_params
    @users              = User.where.not(id: current_user.id)
    @conversation       = Conversation.find_by(id: params[:conversation_id])
  end 

end
