class Cuisine < ApplicationRecord
  has_many :users, :through => :preferences
  has_many(:preferences, :class_name => "Preference", :foreign_key => "cuisine_id")
  has_many :venues
end
