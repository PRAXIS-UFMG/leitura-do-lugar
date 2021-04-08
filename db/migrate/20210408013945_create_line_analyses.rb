# frozen_string_literal: true

class CreateLineAnalyses < ActiveRecord::Migration[6.1]
  def change
    create_table :line_analyses do |t|
      t.string :name
      t.string :type
      t.string :objective
      t.string :description

      t.timestamps
    end
  end
end
