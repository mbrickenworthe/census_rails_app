class AddAge2010ToPeople < ActiveRecord::Migration
  def change
    add_column :people, :age_2010, :integer
  end
end
