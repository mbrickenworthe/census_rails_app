class AddStateAbbrToStates < ActiveRecord::Migration
  def change
    add_column :states, :state_abbr, :string
  end
end
