require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		@user = User.new(first_name: "Lala", last_name: "Lolo", email: "user@example.com")
	end

	test "email address should be unique" do
		duplicate_user = @user.dup
		@user.save
		assert_not duplicate_user.valid?
	end

	test "first_name should be present" do
		@user.first_name = "        "
		assert_not @user.valid?
	end

	test "last_name should be present" do
		@user.last_name = "         "
		assert_not @user.valid?
	end

	test "email should be present" do
		@user.email = "             "
		assert_not @user.valid?
	end
end
