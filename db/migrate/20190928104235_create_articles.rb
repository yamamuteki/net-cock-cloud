class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.integer :board_id
      t.integer :author_id
      t.integer :parent_id
      t.datetime :posted_at

      t.timestamps
    end
  end
end
