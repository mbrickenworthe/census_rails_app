class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :race
      t.string :race_number

      t.timestamps null: false
    end
  end
end
