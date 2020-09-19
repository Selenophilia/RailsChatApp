require "test_helper"

class ChatroomChannelTest < ActionCable::Channel::TestCase
  include ActionCable::TestHelper

  test "check if a message is channel" do
    channel_name = 'my_channel'
      user_data = "message"

      assert_broadcast_on(channel_name, data: user_data) do
        ActionCable.server.broadcast channel_name, data: user_data 
      end
   end 
end
