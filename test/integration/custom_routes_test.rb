require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "the /login route opens the login page" do
    get "/login"
    assert_response :success
  end

  test "the /logout route lands on the homepage" do
    get "/logout"
    assert_response :redirect
    assert_redirected_to  "/"
  end

  test "the /regist route opens the sign up page" do
    get "/register"
    assert_response :success
  end

end
