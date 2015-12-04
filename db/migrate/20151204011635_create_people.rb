class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.integer :age
      t.integer :race_number
      t.string :race
      t.integer :state_number
      t.boolean :male
      t.boolean :female
      t.string :state
      t.text :picture_file
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
