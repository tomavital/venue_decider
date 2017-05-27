class Event < ApplicationRecord
has_many :users, :foreign_key => "creator_id"
  validates :creator_id, :presence => true
end
