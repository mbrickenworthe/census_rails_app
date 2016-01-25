class CreateStateBirthNames < ActiveRecord::Migration
  def change
    create_table :state_birth_names do |t|
      t.string :sex
      t.integer :year
      t.string :name
      t.integer :frequency
      t.references :state
    end
  end
end
