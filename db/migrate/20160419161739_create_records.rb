class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
	  t.integer :uid
	  t.integer :qid
	  t.boolean :correct
      t.timestamps null: false
    end
  end
end
