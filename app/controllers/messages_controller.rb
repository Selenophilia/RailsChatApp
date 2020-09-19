class MessagesController < ApplicationController

  def create
    @message = current_user.messages.create(user: current_user,
                                            message_body:  params.dig(:message, :message_body))
    if @message.save
         #redirect_to messages_path
         ActionCable.server.broadcast "chatroom_channel",
                                        mod_message: message_render(@message)
    else
      flash.now[:alert] = 'error while creating message'
      redirect_to messages_path
    end
  end

  private
  def message_render(message)
        render(partial: 'message', locals: {message: message})
  end
end
