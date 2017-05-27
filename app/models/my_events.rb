class My_event < ApplicationRecord
has_many :users, :foreign_key => "creator_id"
  validates :creator_id, :presence => true

  has_many :guests
  belongs_to :creator, :class_name => "User"
  belongs_to :venue , :foreign_key => "venue_id"
end
