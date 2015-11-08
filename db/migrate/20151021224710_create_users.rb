class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :nFollowing
      t.integer :nFollower
      t.integer :nPost
      t.integer :nSold
      t.timestamps null: false
    end
  end
end
