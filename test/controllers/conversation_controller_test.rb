require 'test_helper'

class ConversationControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conversation = conversations(:conversation)
  end
  test "1.should create conversation when create conversation route is called" do
    post create_conversation_messages_path, params: {sender_id:@conversation.sender_id, recipient_id:@conversation.recipient_id}
    assert_response :redirect 
  end 
end
