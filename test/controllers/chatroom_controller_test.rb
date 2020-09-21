require 'test_helper'

class ChatroomControllerTest < ActionDispatch::IntegrationTest
  test "1.should go to index route" do
    get messages_path
    assert_response :redirect 
  end 
end
