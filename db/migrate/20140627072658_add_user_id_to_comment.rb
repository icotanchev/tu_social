class AddUserIdToComment < ActiveRecord::Migration
  def self.up
  	add_column :comments, :user_id, :integer

  	add_index :comments, :user_id
  end

  def self.down
  	remove_column :comments, :user_id
  end
end
