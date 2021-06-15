class ChangeExcerptTextToMarkdown < ActiveRecord::Migration[6.1]
  def change
    remove_column :excerpts, :text
  end
end
