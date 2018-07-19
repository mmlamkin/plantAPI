class User < ApplicationRecord
  # Include default devise modules.

  has_many :gardens

  validates :email, presence: true, uniqueness: true
end
