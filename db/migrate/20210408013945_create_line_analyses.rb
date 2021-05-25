# frozen_string_literal: true

class CreateLineAnalyses < ActiveRecord::Migration[6.1]
  def change
    create_table :line_analyses do |t|
      t.string :name
      t.string :line_type
      t.string :objective
      t.references :article, foreign_key: true

      t.timestamps
    end
    add_index :line_analyses, :name, unique: true
  end
end
