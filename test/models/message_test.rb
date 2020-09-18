require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  setup do
    @message = messages(:messages)
  end

  test "1. should not create message if message_body is nil" do
     @message.message_body = ""
     assert_not @message.save
  end

  test "2. should not create message if user_id is nil" do
    @message.user_id = ""
    assert_not @message.save
 end

 test "3. should not create message if chatroom_id is nil" do
    @message.chatroom_id = ""
    assert_not @message.save
  end
end
