class Venue < ApplicationRecord

  validates :cuisine, :presence => true
  validates :name, :presence => true, :uniqueness => { :scope => :address }


# has_many :events
# belongs_to :cuisine
# belongs_to :average_price, :class_name => "Price"
end
