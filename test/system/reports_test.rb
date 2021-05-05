# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    login
    @report = reports(:one)
  end

  test 'visiting the index' do
    visit reports_url

    assert_selector 'th', text: 'Relatos'
    assert_selector 'th', text: 'Entrevistado'
    assert_selector 'th', text: 'Data da Entrevista'
    assert_selector 'th', text: 'Aprovado'
  end

  test 'creating a Report' do
    visit reports_url
    click_icon 'Criar relato'

    fill_in 'Endereço', with: @report.address
    check 'Aprovado' if @report.approved
    fill_in 'Texto Completo', with: @report.full_text
    fill_in 'Data da Entrevista', with: '30/05/2021'
    fill_in 'Entrevistado', with: @report.interviewee
    fill_in 'Morador Desde', with: @report.resides_since
    click_icon 'Confirmar'

    assert_text 'Relato criado com sucesso'
  end

  test 'updating a Report' do
    visit reports_url
    click_icon 'Editar'

    check 'Aprovado'
    fill_in 'Morador Desde', with: 2020
    click_icon 'Confirmar'

    assert_text 'Relato editado com sucesso'
  end

  test 'destroying a Report' do
    visit reports_url
    click_icon 'Ações'
    page.accept_confirm do
      click_icon 'Apagar'
    end

    assert_text 'Relato apagado com sucesso'
  end
end
