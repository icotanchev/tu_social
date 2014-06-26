class AddMarksNotifierToUser < ActiveRecord::Migration
  def self.up
  	add_column :users, :new_mark, :boolean

		add_index :users, :new_mark
  end

  def self.down
  	remove_column :users, :new_mark
  end
end
