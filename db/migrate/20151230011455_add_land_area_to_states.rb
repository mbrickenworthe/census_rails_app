class AddLandAreaToStates < ActiveRecord::Migration
  def change
    add_column :states, :land_area, :integer
  end
end
