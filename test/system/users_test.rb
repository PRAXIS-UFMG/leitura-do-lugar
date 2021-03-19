# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    login(@user.username)
  end

  test 'visiting the index' do
    visit users_url
    assert_selector 'h2', text: 'Usuários - Pesquisadores'
  end

  test 'creating a User' do
    visit users_url
    click_on 'Cadastrar novo pesquisador'

    fill_in 'Nome', with: @user.name
    fill_in 'Nome de usuário', with: @user.username
    fill_in 'Senha', with: 'testpassword'
    fill_in 'Confirme a senha', with: 'testpassword'
    check 'Adminitrador'
    click_on 'Enviar'

    assert_text "#{@user.name} (#{@user.username} cadastrado com sucesso"
  end

  test 'updating a User' do
    visit users_url
    click_on 'Editar', match: :first

    fill_in 'Name', with: 'Another Name'
    fill_in 'Username', with: 'another'
    click_on 'Update User'

    assert_text 'Another Name'
    assert_text 'another'
  end

  test 'destroying a User' do
    visit users_url
    page.accept_confirm do
      click_on 'Deletar', match: :first
    end

    assert_text "#{@user.name} (#{@user.username}) foi deletado com sucesso"
  end
end
