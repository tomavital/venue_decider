class Price < ApplicationRecord


  has_many :venues,  :foreign_key => "average_price"

end
