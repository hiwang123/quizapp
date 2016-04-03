class CreateUserTests < ActiveRecord::Migration
  def change
    create_table :user_tests do |t|
	  t.belongs_to :user, index:true
      t.belongs_to :test, index:true
      t.timestamps null: false
    end
  end
end
