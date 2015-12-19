require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get member" do
    get :member
    assert_response :success
  end

  test "should get add" do
    get :add
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get remove" do
    get :remove
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get addCourse" do
    get :addCourse
    assert_response :success
  end

  test "should get removeCourse" do
    get :removeCourse
    assert_response :success
  end

end
