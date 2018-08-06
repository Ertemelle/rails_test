require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "email already user" do
    get '/users/new'
    post '/users', params: {user: {email: "romano@mail.com"}}
      assert flash[:danger], "Email already used"
  end
    test "missing param" do
      get '/users/new'
      post '/users', params:{user:{first_name: "lal", last_name: "lolo ", email: "lili"}}
        assert flash[:danger], "Empty params"
    end

end
