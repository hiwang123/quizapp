class CreateLatests < ActiveRecord::Migration
  def change
    create_table :latests do |t|
	  t.integer :uid
	  t.integer :qid
      t.timestamps null: false
    end
  end
end
