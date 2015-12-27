class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.integer :age
      t.boolean :male, :default => false
      t.text :picture_file
      t.boolean :active_user
      t.references :state
      t.references :user
      t.references :race

      t.timestamps null: false
    end
  end
end
