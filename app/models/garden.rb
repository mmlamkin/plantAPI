class Garden < ApplicationRecord
  has_and_belongs_to_many :plants, join_table: :gardens_plants

  belongs_to :users

  validates :user_id, presence: true

end
