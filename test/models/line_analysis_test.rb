# frozen_string_literal: true

require "test_helper"

class LineAnalysisTest < ActiveSupport::TestCase
  test "Saves valid fixtures" do
    assert line_analyses(:pressao).save
    assert line_analyses(:capacidade).save
  end

  test "Validates name uniqueness" do
    line_analyses(:pressao).tap do |line|
      line.name = "Name"
    end.save!
    errors = line_analyses(:capacidade).then do |l|
      l.name = "Name"
      l.save
      l.errors
    end
    assert_not_empty errors[:name]
  end

  test "Validates presence of attributes" do
    errors = LineAnalysis.new.then do |l|
      l.save
      l.errors
    end
    assert_not_empty errors[:name], "name"
    assert_not_empty errors[:line_type], "line_type"
    assert_not_empty errors[:objective], "objective"
    assert_not_empty errors[:description], "description"
  end

  test "Validates type" do
    assert_raises ArgumentError do
      LineAnalysis.new.line_type = "invalid"
    end
  end
end
