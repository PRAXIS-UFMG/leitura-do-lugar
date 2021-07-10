class ChangeContentNameToSlug < ActiveRecord::Migration[6.1]
  def change
    rename_column :contents, :name, :slug
  end
end
