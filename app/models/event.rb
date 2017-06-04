class Event < ApplicationRecord

  validates :creator_id, :presence => true
  validates :title, :presence => true

  has_many :guests, :class_name => "Guest", :foreign_key => "event_id"
  belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"
  belongs_to :venue, :foreign_key => "venue_id"

end
