class RemoveLateHarvsetFromPlants < ActiveRecord::Migration[5.1]
  def change
    remove_column :plants, :late_harvset, :string
  end
end
