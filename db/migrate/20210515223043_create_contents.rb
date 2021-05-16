class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.string :name
      t.text :text
      t.text :text_md

      t.timestamps
    end
    add_index :contents, :name, unique: true
  end
end
