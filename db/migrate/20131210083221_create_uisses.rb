class CreateUisses < ActiveRecord::Migration
  def change
    create_table :uisses do |t|

      t.timestamps
    end
  end
end
