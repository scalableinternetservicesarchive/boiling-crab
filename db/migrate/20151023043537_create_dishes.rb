class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
    	t.string :name
    	t.string :image_url
    	t.string :description
    	t.decimal :price
      t.timestamps null: false
    end
  end
end
