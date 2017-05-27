class Cuisine < ApplicationRecord
  has_many :preferences
  has_many :venues
end
