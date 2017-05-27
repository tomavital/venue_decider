class Event < ApplicationRecord
has_many :users, :foreign_key => "creator_id"
  validates :creator_id, :presence => true

  has_many :guests, :dependent => :destroy
  belongs_to :creator, :class_name => "User"
end
