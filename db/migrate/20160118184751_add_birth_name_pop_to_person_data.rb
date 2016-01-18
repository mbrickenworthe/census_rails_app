class AddBirthNamePopToPersonData < ActiveRecord::Migration
  def change
    add_column :person_data, :birth_name_pop, :integer
  end
end
