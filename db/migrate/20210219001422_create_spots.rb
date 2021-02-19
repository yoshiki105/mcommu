class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string :place
      t.string :dimension
      t.text :memo
      t.integer :points, array: true
      t.references :world, null: false, foreign_key: true

      t.timestamps
    end
  end
end
