class ChangeColumnToSpots < ActiveRecord::Migration[6.0]
  def change
    remove_column :spots, :points
    add_column :spots, :point_x, :integer
    add_column :spots, :point_y, :integer
    add_column :spots, :point_z, :integer
  end
end
