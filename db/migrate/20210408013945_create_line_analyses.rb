# frozen_string_literal: true

class CreateLineAnalyses < ActiveRecord::Migration[6.1]
  def change
    create_table :line_analyses do |t|
      t.string :name, null: false
      t.string :line_type, null: false
      t.string :objective, null: false
      t.string :description, null: false

      t.timestamps
    end
    add_index :line_analyses, :name, unique: true
  end
end
