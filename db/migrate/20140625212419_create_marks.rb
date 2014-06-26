class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.text :marks
      t.integer :user_id

      t.timestamps
    end
  end
end
