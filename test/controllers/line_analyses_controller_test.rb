# frozen_string_literal: true

require 'test_helper'

class LineAnalysesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_analysis = line_analyses(:pressao)
  end

  test 'should require authentication' do
    get line_analyses_url
    assert_response :redirect

    get new_line_analysis_url
    assert_response :redirect

    get edit_line_analysis_url(@line_analysis)
    assert_response :redirect

    patch line_analysis_url(@line_analysis)
    assert_response :redirect

    delete line_analysis_url(@line_analysis)
    assert_response :redirect
  end

  test 'should get index' do
    login(users(:one).username)

    get line_analyses_url

    assert_response :success
  end

  test 'should get new' do
    login(users(:one).username)

    get new_line_analysis_url

    assert_response :success
  end

  test 'should create line_analysis' do
    login(users(:one).username)

    assert_difference('LineAnalysis.count') do
      post line_analyses_url, params: { line_analysis: {
        description: @line_analysis.description,
        name:        @line_analysis.name,
        objective:   @line_analysis.objective,
        line_type:   @line_analysis.line_type
      } }
    end

    assert_redirected_to line_analysis_url(LineAnalysis.last)
  end

  test 'should show line_analysis' do
    login(users(:one).username)

    get line_analysis_url(@line_analysis)

    assert_response :success
  end

  test 'should get edit' do
    login(users(:one).username)

    get edit_line_analysis_url(@line_analysis)
    assert_response :success
  end

  test 'should update line_analysis' do
    login(users(:one).username)

    patch line_analysis_url(@line_analysis),
          params: { line_analysis: { description: @line_analysis.description, name: @line_analysis.name,
                                     objective:   @line_analysis.objective, line_type: @line_analysis.line_type } }

    assert_redirected_to line_analysis_url(@line_analysis)
  end

  test 'should destroy line_analysis' do
    login(users(:one).username)

    assert_difference('LineAnalysis.count', -1) do
      delete line_analysis_url(@line_analysis)
    end

    assert_redirected_to line_analyses_url
  end
end
