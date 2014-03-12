require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase

  test "should get show" do
      get :show, id: users(:jason).profile_name
      assert_response :success
      assert_template 'profiles/show'
  end

  test "should render a 404 on profiles not found" do
      get :show, id: "doesn't exist"
      assert_response :not_found
  end

  test "that a variables are assigned on a successful profile viewing" do
      get :show, id: users(:jason).profile_name
      assert assigns(:user)
      assert_not_empty assigns(:statuses)
  end

end
