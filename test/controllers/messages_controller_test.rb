require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conversation = conversations(:conversation)
    @user         = users(:user)
    @message      = messages(:messages)
  end
  test "1.should  create message create message route is called" do
    post messages_path,params: {messages:{ user_id: @user.id, conversation_id:@conversation.id, message_body: @message.message_body}}
    assert_response :redirect 
  end 

  test "2.route test " do
    assert_generates '/messages/t/1', { :controller => "messages", :action => "show", :conversation_id => "1" }
  end 
end
