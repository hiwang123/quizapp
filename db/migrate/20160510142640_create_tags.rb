class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
	  t.integer :uid
	  t.integer :qid
      t.timestamps null: false
    end
  end
end
