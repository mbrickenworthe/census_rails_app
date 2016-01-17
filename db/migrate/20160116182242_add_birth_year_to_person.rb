class AddBirthYearToPerson < ActiveRecord::Migration
  def change
    add_column :people, :birth_year, :integer
  end
end
