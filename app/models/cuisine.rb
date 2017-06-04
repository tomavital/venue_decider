class Cuisine < ApplicationRecord


  has_many :preferences, :class_name => "Preference", :foreign_key => "cuisine_id"

  has_many :venues, :class_name => "Venue", :foreign_key => "cuisine"
end
