class AddUserAttributes < ActiveRecord::Migration
  def self.up
		add_column :users, :first_name, :string
		add_column :users, :last_name, :string
		add_column :users, :pin, :string
		add_column :users, :faculty_number, :string
		add_column :users, :send_emails, :boolean

		add_index :users, :first_name
		add_index :users, :last_name
		add_index :users, :pin
		add_index :users, :faculty_number
  end

  def self.down
  	remove_column :users, :first_name, :string
		remove_column :users, :last_name, :string
		remove_column :users, :pin, :string
		remove_column :users, :faculty_number, :string
		remove_column :users, :send_emails, :boolean
  end
end
