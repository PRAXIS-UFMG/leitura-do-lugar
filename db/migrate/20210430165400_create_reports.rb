# frozen_string_literal: true

class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :interviewee
      t.integer :resides_since
      t.text :full_text
      t.string :address
      t.float :addr_lat
      t.float :addr_lon
      t.date :interview_date
      t.boolean :approved, null: false, default: false

      t.timestamps
    end
  end
end
