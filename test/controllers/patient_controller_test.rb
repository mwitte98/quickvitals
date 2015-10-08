require 'test_helper'

class PatientControllerTest < ActionController::TestCase
  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get record" do
    get :record
    assert_response :success
  end

  test "should get tasks" do
    get :tasks
    assert_response :success
  end

end
