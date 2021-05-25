class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.text :markdown
      t.text :rendered

      t.timestamps
    end
  end
end
