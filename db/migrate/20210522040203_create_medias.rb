class CreateMedias < ActiveRecord::Migration[6.1]
  def change
    create_table :medias do |t|
      t.string :name
      t.text :description
      t.boolean :inline, null: false, default: false
      t.json :file_data
      t.references :owner, polymorphic: true

      t.timestamps
    end
  end
end
