class AddColumnStateAbbrToStateBirthNames < ActiveRecord::Migration
  def change
    add_column :state_birth_names, :state_abbr, :string
  end
end
