class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :title
    	t.string :description
    	t.decimal :price
    	t.references :user, index: true, foreign_key: true
      t.integer :sell_to, references: :users, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
