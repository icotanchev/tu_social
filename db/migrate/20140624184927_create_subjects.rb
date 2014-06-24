class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :title
      t.text :exam_info
      t.text :subject_info
      t.text :requirements
      t.integer :user_id

      t.timestamps
    end
  end
end
