class AddLateHarvestToPlants < ActiveRecord::Migration[5.1]
  def change
    add_column :plants, :late_harvest, :string
  end
end
