class CreatePersonData < ActiveRecord::Migration
  def change
    create_table :person_data do |t|
      t.text :json_hash
      t.integer :state_pop
      t.integer :age_pop
      t.integer :gender_pop
      t.integer :gender_race_pop
      t.integer :gender_age_pop
      t.integer :gender_age_and_race_pop
      t.references :person

      t.timestamps null: false
    end
  end
end
