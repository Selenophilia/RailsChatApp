class MessagesController < ApplicationController

  def create
    @message = current_user.messages.create(user: current_user,
                                            message_body:  params.dig(:message, :message_body))
    if @message.save
         redirect_to messages_path
    else
      flash.now[:alert] = 'error while creating message'
      redirect_to messages_path
    end
  end
end
