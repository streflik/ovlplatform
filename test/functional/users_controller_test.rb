require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get hub" do
    get :hub
    assert_response :success
  end

  test "should get credits" do
    get :credits
    assert_response :success
  end

end
