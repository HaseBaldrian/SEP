require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    dummy = users(:one)
    post :create, :name => dummy.name, :passwort => "MyString"
    asser_redirected_to admin_url
    assert_equal dummy.id, session[:user_id]
  end

  test "should fail login" do
    dummy = users(:one)
    post :create, :name => dummy.name, :passwort => "foisch"
    assert_redirected_to login_url
  end
  
  test "should logout" do
    delete :destroy
    assert_redirected_to users_url
  end

end
