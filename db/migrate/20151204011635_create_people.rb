class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.integer :age
      t.integer :race_number
      t.string :race
      t.boolean :male
      t.boolean :female
      t.text :picture_file
      t.boolean :admin
      t.references :state

      t.timestamps null: false
    end
  end
end
