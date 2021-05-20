# frozen_string_literal: true

require "application_system_test_case"

class LineAnalysesTest < ApplicationSystemTestCase
  setup do
    login
    @line = line_analyses(:pressao)
  end

  test "visiting the index" do
    visit line_analyses_url

    assert_selector "th", text: "Linhas de Análise"
    assert_text line_analyses(:pressao).name
    assert_text line_analyses(:capacidade).name
  end

  test "creating a LineAnalysis" do
    visit line_analyses_url
    click_icon "Criar linha de análise"

    fill_in "Nome", with: "Another Line"
    fill_in "Descrição", with: @line.description
    fill_in "Objetivo", with: @line.objective
    fill_in "Tipo", with: @line.line_type
    click_icon "Confirmar"

    assert_text "Linha de análise cadastrada com sucesso"
    assert_text "Another Line"
  end

  test "updating a LineAnalysis" do
    visit line_analyses_url
    click_icon "Ações"
    click_icon "Editar"

    fill_in "Descrição", with: "Another description"
    click_icon "Confirmar"

    assert_text "Linha de análise atualizada com sucesso"
    assert_text "Another description"
  end

  test "destroying a LineAnalysis" do
    visit line_analyses_url
    click_icon "Ações"

    page.accept_confirm do
      click_icon "Remover"
    end

    assert_text "Linha de análise apagada com sucesso"
  end
end
