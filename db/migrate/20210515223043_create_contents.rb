class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.string :name
      t.references :article, foreign_key: true

      t.timestamps
    end
    add_index :contents, :name, unique: true
  end
end
