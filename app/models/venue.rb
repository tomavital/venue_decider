class Venue < ApplicationRecord

  validates :cuisine, :presence => true
  validates :name, :presence => true, :uniqueness => { :scope => :address }
  validates :average_price, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5000}
end
