class Cuisine < ApplicationRecord
  has_many :preferences,  :foreign_key => "cuisine_id"
  has_many :venues,  :foreign_key => "cuisine"
end
