class AddSellToToPost < ActiveRecord::Migration
  def change
    add_column :posts, :sell_to, :integer, references: :users, index: true, foreign_key: true
  end
end
