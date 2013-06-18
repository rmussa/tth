require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "a user should enter their first name" do
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?
	end

	test "a user should enter their last name" do
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end

	test "a user should enter their profile name" do
		user = User.new
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "a user should have a unique profile name" do
		user = User.new
		user.profile_name = users(:Raheem).profile_name
		user.email = users(:Raheem).email
		user.first_name = users(:Raheem).first_name
		user.last_name = users(:Raheem).last_name
		
		assert !user.save
		puts user.errors.inspect
		assert !user.errors[:profile_name].empty?
	end

	test "a user should have no spaces in profile name" do
		user = User.new
		user.profile_name = 'A Profile Name with Spaces'
		
		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Must be formatted correctly.")
	end
end
