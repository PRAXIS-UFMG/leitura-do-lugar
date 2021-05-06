class AddDescriptionMdToLineAnalysis < ActiveRecord::Migration[6.1]
  def change
    add_column :line_analyses, :description_md, :text
  end
end
