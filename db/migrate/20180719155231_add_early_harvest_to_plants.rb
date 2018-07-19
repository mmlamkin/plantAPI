class AddEarlyHarvestToPlants < ActiveRecord::Migration[5.1]
  def change
    add_column :plants, :early_harvest, :string
  end
end
