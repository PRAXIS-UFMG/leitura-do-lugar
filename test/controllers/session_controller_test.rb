# frozen_string_literal: true

require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test 'gets login' do
    get login_url

    assert_response :success
  end

  test 'log in with wrong password' do
    user = users :admin

    post login_url, params: { session: { username: user.username, password: 'wrong' } }

    assert_response :redirect
    assert_nil session[:user_id]
  end

  test 'log in and set session' do
    user = users :admin

    post login_url, params: { session: { username: user.username, password: 'testpassword' } }

    assert_redirected_to admin_root_url
    assert_not_nil session[:user_id]
  end

  test 'log out and unset session' do
    login(users(:admin).username)
    assert_not_nil session[:user_id]

    delete logout_url

    assert_redirected_to root_url
    assert_nil session[:user_id]
  end
end
