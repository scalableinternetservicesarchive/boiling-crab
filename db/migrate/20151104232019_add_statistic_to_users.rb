class AddStatisticToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nFollowing, :integer
    add_column :users, :nFollower, :integer
    add_column :users, :nPost, :integer
  end
end
