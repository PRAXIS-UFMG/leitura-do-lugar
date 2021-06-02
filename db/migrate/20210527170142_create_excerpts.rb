class CreateExcerpts < ActiveRecord::Migration[6.1]
  def change
    create_table :excerpts do |t|
      t.references :report, null: false, foreign_key: true
      t.text :text
      t.boolean :approved

      t.timestamps
    end
  end
end
