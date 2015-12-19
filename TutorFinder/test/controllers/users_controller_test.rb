require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get signup" do
    get :signup
    assert_response :success
  end

  test "should get remove" do
    get :remove
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

end
