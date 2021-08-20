class RemoveInlineFromImages < ActiveRecord::Migration[6.1]
  def change
    remove_column :medias, :inline
  end
end
