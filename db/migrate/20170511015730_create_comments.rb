class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.belongs_to :article, foreign_key: true
      t.string :visitor_name, null: false
      t.string :email, null: false
      t.string :website
      t.text :message, limit: 16.megabytes + 1, null: false

      t.timestamps
    end
  end
end
