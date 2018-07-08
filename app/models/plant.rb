class Plant < ApplicationRecord
  has_and_belongs_to_many :gardens, join_table: :gardens_plants
end
