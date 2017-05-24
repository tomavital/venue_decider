class Price < ApplicationRecord

  has_many :users, :foreign_key => "max_price"
  has_many :venues, :foreign_key => "average_price"
  
end
