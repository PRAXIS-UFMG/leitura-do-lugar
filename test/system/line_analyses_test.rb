# frozen_string_literal: true

require 'application_system_test_case'

class LineAnalysesTest < ApplicationSystemTestCase
  setup do
    @line_analysis = line_analyses(:one)
  end

  test 'visiting the index' do
    visit line_analyses_url
    assert_selector 'h1', text: 'Line Analyses'
  end

  test 'creating a Line analysis' do
    visit line_analyses_url
    click_on 'New Line Analysis'

    fill_in 'Description', with: @line_analysis.description
    fill_in 'Name', with: @line_analysis.name
    fill_in 'Objective', with: @line_analysis.objective
    fill_in 'Type', with: @line_analysis.type
    click_on 'Create Line analysis'

    assert_text 'Line analysis was successfully created'
    click_on 'Back'
  end

  test 'updating a Line analysis' do
    visit line_analyses_url
    click_on 'Edit', match: :first

    fill_in 'Description', with: @line_analysis.description
    fill_in 'Name', with: @line_analysis.name
    fill_in 'Objective', with: @line_analysis.objective
    fill_in 'Type', with: @line_analysis.type
    click_on 'Update Line analysis'

    assert_text 'Line analysis was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Line analysis' do
    visit line_analyses_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Line analysis was successfully destroyed'
  end
end
