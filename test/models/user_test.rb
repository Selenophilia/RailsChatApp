require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:user)
   # byebug
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.email = "email@email.com"
    assert @user.valid?
  end
end
