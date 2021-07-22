class ChangeExcerptLineToHabtm < ActiveRecord::Migration[6.1]
  def change
    remove_column :excerpts, :line_analysis_id
    create_join_table :excerpts, :line_analyses
  end
end
