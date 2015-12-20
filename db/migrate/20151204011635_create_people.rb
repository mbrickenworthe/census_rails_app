class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.integer :age
      t.integer :race_number
      t.string :race
      t.boolean :male, :default => false
      t.boolean :female, :default => true
      t.text :picture_file
      t.boolean :active_user
      t.references :state
      t.references :user

      t.timestamps null: false
    end
  end
end
