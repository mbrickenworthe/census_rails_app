class CreateCencusCalls < ActiveRecord::Migration
  def change
    create_table :cencus_calls do |t|
      t.string :call

      t.timestamps null: false
    end
  end
end
