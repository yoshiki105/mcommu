class CreateWorlds < ActiveRecord::Migration[6.0]
  def change
    create_table :worlds do |t|
      t.string :name
      t.integer :seed, limit: 8

      t.timestamps
    end
  end
end
