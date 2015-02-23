class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.decimal :price

      t.references :category
      t.references :author

      t.timestamps
    end

    add_index :articles, :category_id
    add_index :articles, :author_id
  end
end
