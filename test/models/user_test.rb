require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:user)
  end

  test "should not save if email format is incorrect" do
    @user.email = "emailemail.com"
    assert_match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, "sample@email.com", "Email invalid" )
    assert_not @user.save, "Saved the email field with incorrect format"
  end
  
  test "email  should have a minimum of atleast 4 characters" do
    @user.email = "na@email.com"
    assert_not_equal [@user.email], 'email@email.com', "Invalid email, email should have atleast 4 char"
  end

  test "should be valid if email format is correct" do
    assert @user.valid?
  end

  test "email should be unique" do
    duplicate_item = @user.dup
    @user.save(validate: false)
    duplicate_item.valid? 
    assert duplicate_item.errors
    assert duplicate_item.errors[:username]
end
  
  test "email should not save if not present during sign up" do
    @user.email = "" 
    assert_not @user.save
  end

  test "password should not save if not present during sign up" do
    @user.password = ""
    assert_not @user.save
  end
  
  test "email should be present" do
    @user.email = "email@email.com"
    assert @user.valid?
  end
end
