class Restaurant < ApplicationRecord
  belongs_to :city
  has_many :meals
end
