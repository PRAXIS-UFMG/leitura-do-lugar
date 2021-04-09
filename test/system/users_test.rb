# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup do
    login(users(:one).username)
  end

  test 'visiting the index' do
    visit users_url
    assert_selector 'th', text: 'Usuários'
  end

  test 'creating a User' do
    visit users_url
    click_icon 'Criar usuário'

    fill_in 'Nome', with: 'A Name'
    fill_in 'Username', with: 'someone'
    fill_in 'Senha', with: 'mypassword'
    fill_in 'Confirme a senha', with: 'mypassword'
    check 'Admin'
    click_icon 'Confirmar'

    assert_text 'Usuário cadastrado com sucesso'
  end

  test 'updating a User' do
    visit users_url
    click_icon 'Ações'
    click_icon 'Editar'

    fill_in 'Nome', with: 'Another Name'
    fill_in 'Username', with: 'another'
    click_icon 'Confirmar'

    assert_text 'Another Name'
    assert_text 'another'
  end

  test 'destroying a User' do
    visit users_url
    page.accept_confirm do
      click_icon 'Ações'
      click_icon 'Remover'
    end

    assert_text 'Usuário apagado com sucesso'
  end
end
