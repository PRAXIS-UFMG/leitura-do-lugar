# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users :one
  end

  test 'should require authentication' do
    get users_url
    assert_response :not_authorized
    get new_user_url
    assert_response :not_authorized
    get edit_user_url(@user)
    assert_response :not_authorized
    patch user_url(@user)
    assert_response :not_authorized
    delete user_url(@user)
    assert_response :not_authorized
  end

  def login
    super(@user.username)
  end

  test 'should get new after login' do
    login
    get new_user_url
    assert_response :success
  end

  test 'should create user' do
    login
    assert_difference('User.count') do
      post users_url, params: { user: @user.attributes }
    end

    assert_redirected_to user_url(User.last)
  end

  test 'should show user' do
    login
    get user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    login
    get edit_user_url(@user)
    assert_response :success
  end

  test 'should update user' do
    login
    patch user_url(@user), params: { user: @user.attributes }
    assert_redirected_to user_url(@user)
  end

  test 'should destroy user' do
    login
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
