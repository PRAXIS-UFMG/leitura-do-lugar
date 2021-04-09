# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users :two
  end

  test 'should require authentication' do
    get users_url
    assert_response :redirect

    get new_user_url
    assert_response :redirect

    get edit_user_url(@user)
    assert_response :redirect

    patch user_url(@user)
    assert_response :redirect

    delete user_url(@user)
    assert_response :redirect
  end

  test 'should get new after login(@user.username)' do
    login(@user.username)
    get new_user_url
    assert_response :success
  end

  test 'should create user' do
    login(@user.username)
    assert_difference('User.count') do
      post users_url, params: { user: {
        name: 'A Name',
        username: 'username',
        password: 'password'
      } }
    end

    assert_redirected_to user_url(User.last)
  end

  test 'should show user' do
    login(@user.username)
    get user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    login(@user.username)
    get edit_user_url(@user)
    assert_response :success
  end

  test 'should update user' do
    login(@user.username)
    patch user_url(@user), params: { user: @user.then do |u|
      u.name = 'Another'
      u.attributes
    end }
    assert_redirected_to user_url(@user)
  end

  test 'should destroy user' do
    login(@user.username)
    an_user = users(:two)

    assert_difference('User.count', -1) do
      delete user_url(an_user)
    end

    assert_redirected_to users_url
  end
end
