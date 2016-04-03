class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
	  t.string :title
	  t.string :sharecode
	  t.references :user

      t.timestamps null: false
    end
  end
end
