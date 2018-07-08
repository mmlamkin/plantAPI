class CreateGardensPlants < ActiveRecord::Migration[5.1]
  def change
    create_join_table :gardens, :plants do |t|
      # t.index [:garden_id, :plant_id]
      # t.index [:plant_id, :garden_id]
    end
  end
end
