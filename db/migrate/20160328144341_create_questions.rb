class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
	  t.text :prob
	  t.string :attachment
	  t.string :tag
	  t.integer :typ
	  t.text :ans
	  t.text :explain
	  t.references :test
      t.timestamps null: false
    end
  end
end
