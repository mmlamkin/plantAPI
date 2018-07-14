class CreateZones < ActiveRecord::Migration[5.1]
  def change
    create_table :zones do |t|
      t.integer :zone
      t.string :early_harvest
      t.string :late_harvest

      t.timestamps
    end
  end
end
