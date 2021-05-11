# frozen_string_literal: true

class CreatePeriods < ActiveRecord::Migration[6.1]
  def change
    create_table :periods do |t|
      t.string :name
      t.text :description
      t.text :description_md
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
