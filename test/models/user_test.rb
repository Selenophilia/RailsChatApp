require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should go to index" do
    get new_user_session_url
    assert :success
  end
end
