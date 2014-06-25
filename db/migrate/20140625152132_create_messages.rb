class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :recipient
      t.integer :sender
      t.string :subject
      t.text :content
      t.boolean :msg_read

      t.timestamps
    end

    add_index :messages, [:recipient, :sender, :subject]
  end
end
