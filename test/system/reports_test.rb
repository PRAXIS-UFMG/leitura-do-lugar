# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:one)
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: 'Reports'
  end

  test 'creating a Report' do
    visit reports_url
    click_on 'New Report'

    fill_in 'Addr lat', with: @report.addr_lat
    fill_in 'Addr lon', with: @report.addr_lon
    fill_in 'Address', with: @report.address
    check 'Approved' if @report.approved
    fill_in 'Full text', with: @report.full_text
    fill_in 'Interview date', with: @report.interview_date
    fill_in 'Interviewee', with: @report.interviewee
    fill_in 'Resides since', with: @report.resides_since
    click_on 'Create Report'

    assert_text 'Report was successfully created'
    click_on 'Back'
  end

  test 'updating a Report' do
    visit reports_url
    click_on 'Edit', match: :first

    fill_in 'Addr lat', with: @report.addr_lat
    fill_in 'Addr lon', with: @report.addr_lon
    fill_in 'Address', with: @report.address
    check 'Approved' if @report.approved
    fill_in 'Full text', with: @report.full_text
    fill_in 'Interview date', with: @report.interview_date
    fill_in 'Interviewee', with: @report.interviewee
    fill_in 'Resides since', with: @report.resides_since
    click_on 'Update Report'

    assert_text 'Report was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Report was successfully destroyed'
  end
end
