class Venue < ApplicationRecord

  validates :cuisine, :presence => true
  validates :name, :presence => true, :uniqueness => { :scope => :address }


# has_many :events
# belongs_to :cuisine
belongs_to(:cuisine, :class_name => "Cuisine", :foreign_key => "cuisine")
belongs_to(:price, :class_name => "Price", :foreign_key => "average_price")
end
