class User < ApplicationRecord
  # Include default devise modules.

  has_many :gardens
end
