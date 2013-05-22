require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  fixtures :users

  test "user attributes must not be empty" do
    user = User.new
    assert user.invalid? 
    assert user.errors[:name].any?
    assert user.errors[:email].any?
  end  

  test "email must be valid" do
    user = users(:one)
    assert user.valid?
    
    user.email = "abc@gmx.de"
    assert user.valid?
    
    user.email = "xxx"
    assert user.invalid?
  end

end
