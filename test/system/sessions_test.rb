# frozen_string_literal: true

require 'application_system_test_case'

class SessionsTest < ApplicationSystemTestCase
  setup do
    @user = users :one
  end

  test 'incorrect login' do
    visit session_login_url

    assert_selector 'h2', text: 'Login'
    fill_in 'Nome de Usuário', with: @user.username
    fill_in 'Senha', with: 'password'
    click_button 'Entrar'

    assert_text 'Senha ou usuário incorretos'
  end

  test 'correct login' do
    visit session_login_url

    assert_selector 'h2', text: 'Login'
    fill_in 'Nome de Usuário', with: @user.username
    fill_in 'Senha', with: 'testpassword'
    click_button 'Entrar'

    refute_text 'incorreto'
    assert_text @user.name
  end
end
