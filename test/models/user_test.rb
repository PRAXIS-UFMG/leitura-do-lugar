# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'Validates presence of name' do
    user      = users :two
    user.name = nil
    assert_not user.save
    assert_not_empty user.errors[:name]
  end

  test 'Validates presence of username' do
    user          = users :two
    user.username = nil
    assert_not user.save
    assert_not_empty user.errors[:username]
  end

  test 'Validates uniqueness of username' do
    users(:one).tap do |u|
      u.password = 'testpassword'
    end.save!
    user          = users :two
    user.username = users(:one).username
    assert_not user.save
    assert_not_empty user.errors[:username]
  end
end
