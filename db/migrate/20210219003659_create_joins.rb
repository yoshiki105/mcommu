class CreateJoins < ActiveRecord::Migration[6.0]
  def change
    create_table :joins do |t|
      t.references :user, null: false, foreign_key: true
      t.references :world, null: false, foreign_key: true

      t.timestamps
    end
    add_index :joins, %i[user_id world_id], unique: true
  end
end
