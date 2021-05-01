# frozen_string_literal: true

class ChangeLineAnalysisDescriptionToText < ActiveRecord::Migration[6.1]
  def change
    change_column :line_analyses, :description, :text
  end
end
