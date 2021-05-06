# frozen_string_literal: true

class AddFullTextMdToReport < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :full_text_md, :text
  end
end
