class AddIndexesToSubjectAndTopic < ActiveRecord::Migration
  def change
  	add_index :subjects, [:title, :user_id]

  	add_index :topics, [:title, :user_id]
  end
end
