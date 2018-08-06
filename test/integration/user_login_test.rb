require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:bob)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "" } }
    assert_template 'sessions/new'
    get home_path
  end

  test "Valid login" do
    get login_path
    post login_path, params: { session: { user_id: @user.id, email: @user.email } }
    follow_redirect!
    get home_path
      assert_select("a[href=?]", logout_path)
      assert_select("a[href='/club']")
      assert_select("a[href=?]", user_path(@user))
  end
end