class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
	  t.integer :uid
	  t.integer :tid
	  t.float :grade
      t.timestamps null: false
    end
  end
end
