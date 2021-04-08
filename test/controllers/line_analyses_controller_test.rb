# frozen_string_literal: true

require 'test_helper'

class LineAnalysesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_analysis = line_analyses(:one)
  end

  test 'should get index' do
    get line_analyses_url
    assert_response :success
  end

  test 'should get new' do
    get new_line_analysis_url
    assert_response :success
  end

  test 'should create line_analysis' do
    assert_difference('LineAnalysis.count') do
      post line_analyses_url,
           params: { line_analysis: { description: @line_analysis.description, name: @line_analysis.name,
                                      objective: @line_analysis.objective, type: @line_analysis.type } }
    end

    assert_redirected_to line_analysis_url(LineAnalysis.last)
  end

  test 'should show line_analysis' do
    get line_analysis_url(@line_analysis)
    assert_response :success
  end

  test 'should get edit' do
    get edit_line_analysis_url(@line_analysis)
    assert_response :success
  end

  test 'should update line_analysis' do
    patch line_analysis_url(@line_analysis),
          params: { line_analysis: { description: @line_analysis.description, name: @line_analysis.name,
                                     objective: @line_analysis.objective, type: @line_analysis.type } }
    assert_redirected_to line_analysis_url(@line_analysis)
  end

  test 'should destroy line_analysis' do
    assert_difference('LineAnalysis.count', -1) do
      delete line_analysis_url(@line_analysis)
    end

    assert_redirected_to line_analyses_url
  end
end
