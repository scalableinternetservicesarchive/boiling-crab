class AddNSoldToUser < ActiveRecord::Migration
  def change
    add_column :users, :nSold, :integer
  end
end
