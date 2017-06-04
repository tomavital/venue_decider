class Price < ApplicationRecord


  has_many :venues,  :class_name => "Venue",  :foreign_key => "average_price"

end
