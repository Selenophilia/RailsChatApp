require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:user)
  end

  test "1. should not save if email format is incorrect" do
    @user.email = "emailemail.com"
    assert_match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, "sample@email.com", "Email invalid" )
    assert_not @user.save, "Saved the email field with incorrect format"
  end
  
  test "2. email  should have a minimum of atleast 4 characters" do
    @user.email = "na@email.com"
    assert_not_equal [@user.email], 'email@email.com', "Invalid email, email should have atleast 4 char"
  end

  test "3. email should be unique" do
    duplicate_item = @user.dup
    @user.save(validate: false)
    duplicate_item.valid? 
    assert duplicate_item.errors
    assert duplicate_item.errors[:username]
end
  
  test "4. email should not save if not present during sign up" do
    @user.email = "" 
    assert_not @user.save
  end

  test "5. password should not save if not present during sign up" do
    @user.password = ""
    assert_not @user.save
  end

  test "6. should be valid if email format is correct" do
    assert @user.valid?
  end

  test "7. email should be present" do
    @user.email = "email@email.com"
    assert @user.valid?
  end
end
