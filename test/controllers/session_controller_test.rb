# frozen_string_literal: true

require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test 'should get login' do
    get session_login_url
    assert_response :success
  end

  test 'should get logout' do
    get session_logout_url
    assert_response :success
  end

  test 'should log in and set session' do
    user = users :one
    post session_login_url, params: { session: { username: user.username, password: 'testpassword' } }
    assert_response :success
    assert_not_empty session[:user_id]
  end

  test 'should log out and unset session' do
    user = users :one
    login(user.username)
    delete session_logout_url
    assert_response :success
    assert_empty session[:user_id]
  end
end
