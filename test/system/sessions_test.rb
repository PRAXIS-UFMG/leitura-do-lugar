# frozen_string_literal: true

require 'application_system_test_case'

class SessionsTest < ApplicationSystemTestCase
  setup do
    @user = users :one
  end

  test 'incorrect login' do
    visit login_url

    assert_selector 'h2', text: 'área do pesquisador'
    fill_in 'session_username', with: @user.username
    fill_in 'session_password', with: 'password'
    click_button 'entrar'

    assert_text 'Usuário ou senha incorretos'
  end

  test 'correct login' do
    visit login_url

    assert_selector 'h2', text: 'área do pesquisador'
    fill_in 'session_username', with: @user.username
    fill_in 'session_password', with: 'testpassword'
    click_button 'entrar'

    refute_text 'incorretos'
    assert_text @user.name
  end
end
