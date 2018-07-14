class Garden < ApplicationRecord
  has_and_belongs_to_many :plants, join_table: :gardens_plants
  has_one :zone
end
