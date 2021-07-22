class AddLineAnalysisToExcerpt < ActiveRecord::Migration[6.1]
  def change
    add_reference :excerpts, :line_analysis, foreign_key: true
  end
end
