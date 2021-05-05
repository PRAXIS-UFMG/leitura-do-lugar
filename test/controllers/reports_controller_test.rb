# frozen_string_literal: true

require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report = reports :one
    login(users(:common).username)
  end

  test 'should require authentication' do
    delete logout_url

    get reports_url
    assert_response :redirect

    get new_report_url
    assert_response :redirect

    get edit_report_url @report
    assert_response :redirect

    get report_url @report
    assert_response :redirect

    patch report_url @report
    assert_response :redirect

    delete report_url @report
    assert_response :redirect
  end

  test 'should get index' do
    get reports_url
    assert_response :success
  end

  test 'should get new' do
    get new_report_url
    assert_response :success
  end

  test 'should create report' do
    assert_difference('Report.count') do
      post reports_url,
           params: { report: {
             address:        @report.address,
             approved:       @report.approved,
             full_text:      @report.full_text,
             interview_date: @report.interview_date,
             interviewee:    @report.interviewee,
             resides_since:  @report.resides_since
           } }
    end

    assert_redirected_to report_url(Report.last)
  end

  test 'should show report' do
    get report_url(@report)
    assert_response :success
  end

  test 'should get edit' do
    get edit_report_url(@report)
    assert_response :success
  end

  test 'should update report' do
    patch report_url(@report),
          params: { report: {
            address:        @report.address,
            approved:       @report.approved,
            full_text:      @report.full_text,
            interview_date: @report.interview_date,
            interviewee:    @report.interviewee,
            resides_since:  @report.resides_since
          } }
    assert_redirected_to report_url(@report)
  end

  test 'should destroy report' do
    assert_difference('Report.count', -1) do
      delete report_url(@report)
    end

    assert_redirected_to reports_url
  end
end
