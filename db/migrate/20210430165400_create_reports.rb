# frozen_string_literal: true

class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :interviewee, null: false
      t.integer :resides_since, null: false
      t.text :full_text, null: false
      t.string :address, null: false
      t.float :addr_lat
      t.float :addr_lon
      t.date :interview_date, null: false
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
