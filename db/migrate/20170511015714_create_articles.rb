class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.belongs_to :tag, foreign_key: true
      t.string :title, null: false
      t.text :body, limit: 16.megabytes + 1, null: false
      t.integer :comments_count, default: 0
      t.boolean :public, default: true
      t.integer :hit_count, default: 0

      t.timestamps
    end
  end
end
