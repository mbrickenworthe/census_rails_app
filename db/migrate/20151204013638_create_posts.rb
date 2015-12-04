class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.boolean :vote_able
      t.datetime :created
      t.references :person

      t.timestamps null: false
    end
  end
end
