class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.text :markdown
      t.text :rendered
      t.references :owner, polymorphic: true

      t.timestamps
    end
  end
end
