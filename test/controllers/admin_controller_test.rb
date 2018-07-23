require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get clubs" do
    get :clubs
    assert_response :success
  end

  test "should get cbooks" do
    get :cbooks
    assert_response :success
  end

  test "should get users" do
    get :users
    assert_response :success
  end

end
