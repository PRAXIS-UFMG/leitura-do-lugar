class AddTitleToContents < ActiveRecord::Migration[6.1]
  def change
    add_column :contents, :title, :string
  end
end
