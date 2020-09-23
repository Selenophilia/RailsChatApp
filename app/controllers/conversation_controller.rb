class ConversationController < ApplicationController
    def create
        chk_convo = Conversation.between(params[:sender_id],params[:recipient_id])

        if chk_convo.present?
           @conversation = chk_convo.first
        else
         @conversation = Conversation.create!(conversation_params)
        end
        redirect_to messages_show_path(@conversation)
    end
    private
    def conversation_params
         params.permit(:sender_id, :recipient_id)
    end

end
