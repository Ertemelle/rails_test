require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@user = users(:bob)
  end

  test 'Get to homepage' do
    get '/'
    assert_response :success
  end

  test 'Assert the presence of login links when logged out' do
    get '/'
    assert_select "a[href=?]", club_path, count: 0
    assert_select "a[href=?]", login_path, count: 2
  end

  test 'Assert the presence of club link when logged in' do
    get login_path
    post login_path, params: { session: { email: @user.email  } }
    follow_redirect!
    get '/'
    assert_select "a[href=?]", club_path, count: 2
    assert_select "a[href=?]", login_path, count: 0
  end

  test 'Assert redirection to login when logged_out' do
    get '/club'
    assert_redirected_to 'sessions#new'
    follow_redirect!
  end

  test 'Assert the presence of profile link when logged in' do
    get login_path
    post login_path, params: { session: { email: @user.email  } }
    follow_redirect!
    get '/'
    assert_select "a[href=?]", user_path(@user), count: 1
  end

  test 'Show info of the user after logged in' do
    get login_path
    post login_path, params: { session: { email: @user.email  } }
    get user_path(@user)
    assert_select "h1", "Welcome #{@user.first_name}"
  end

  test 'Assert possibility to access club page when logged_in' do
    get login_path
    post login_path, params: { session: { email: @user.email  } }
    assert_redirected_to club_path
    follow_redirect!
  end
end
