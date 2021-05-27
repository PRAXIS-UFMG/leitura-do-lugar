class AddInlineToMedia < ActiveRecord::Migration[6.1]
  def change
    add_column :media, :inline, :boolean, null: false, default: false
  end
end
