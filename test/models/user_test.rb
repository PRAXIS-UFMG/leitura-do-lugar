# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "Validates presence of name" do
    user = users :common
    user.name = nil
    assert_not user.save
    assert_not_empty user.errors[:name]
  end

  test "Validates presence of username" do
    user = users :common
    user.username = nil
    assert_not user.save
    assert_not_empty user.errors[:username]
  end

  test "Validates uniqueness of username" do
    users(:admin).tap do |u|
      u.password = "testpassword"
    end.save!
    user = users :common
    user.username = users(:admin).username
    assert_not user.save
    assert_not_empty user.errors[:username]
  end
end
