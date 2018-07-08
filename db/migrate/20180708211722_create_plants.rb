class CreatePlants < ActiveRecord::Migration[5.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :description
      t.string :optimal_sun
      t.string :planting_considerations
      t.string :when_to_plant
      t.string :growing_from_seed
      t.string :spacing
      t.string :watering
      t.string :other_care
      t.string :diseases
      t.string :pests
      t.string :harvesting
      t.string :image

      t.timestamps
    end
  end
end
