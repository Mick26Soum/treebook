require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_many(:user_friendships)
  should have_many(:friends)

  test "a user should enter first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end

  test "a user should enter last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end

  test "a user should enter profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
    user = User.new
    user.profile_name = users(:jason).profile_name
    assert !user.save
    puts user.errors.inspect
    assert !user.errors[:profile_name].empty?
  end

  test "a user should have profile name without spaces" do
    user = User.new(first_name: 'jason', last_name: "Seifer", email: "Mick26Soum@gmail.com")
    user.password = user.password_confirmation = "absdfasdfads"

    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly.")

  end

  test "a user should have correctly formatted name" do
    user = User.new(first_name: 'jason', last_name: "Seifer", email: "Mick26Soum@gmail.com")
    user.password = user.password_confirmation = "absdfasdfads"

    user.profile_name = "ToorItDude_1"
    assert user.valid?

  end

  test "that no errors are raised when trying to access friends list" do
    assert_nothing_raised do
      users(:jason).friends
    end
  end

  test "that creating a friendship on users works" do
    users(:jason).friends << users(:mike)
    users(:jason).friends.reload
    assert users(:jason).friends.include?(users(:mike))
  end

end
