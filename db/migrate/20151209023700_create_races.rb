class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :name
      t.string :race_letter

      t.timestamps null: false
    end
  end
end
