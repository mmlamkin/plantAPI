class CreatePlants < ActiveRecord::Migration[5.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :synonyms
      t.string :description
      t.string :height
      t.string :spread
      t.string :maintenance
      t.string :care
      t.string :image
      t.string :earlyCrop
      t.string :lateCrop

      t.timestamps
    end
  end
end
