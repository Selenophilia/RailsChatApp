require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:user)
  end

  test "1. email  should have a minimum of atleast 4 characters" do
    @user.email = "na@email.com"
    assert_not_equal [@user.email], 'email@email.com', "Invalid email, email should have atleast 4 char"
  end

  test "2. email should be unique" do
    duplicate_item = @user.dup
    @user.save(validate: false)
    duplicate_item.valid? 
    assert duplicate_item.errors
    assert duplicate_item.errors[:username]
end
  
  test "3. email should not save if not present during sign up" do
    @user.email = "" 
    assert_not @user.save
  end

  test "4. password should not save if not present during sign up" do
    @user.password = ""
    assert_not @user.save
  end

  test "5. should be valid if email format is correct" do
    assert @user.valid?
  end

  test "6. email should be present" do
    @user.email = "email@email.com"
    assert @user.valid?
  end
end
