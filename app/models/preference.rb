class Preference < ApplicationRecord
  belongs_to(:user, :class_name => "User", :foreign_key => "user_id")
  belongs_to(:cuisine, :class_name => "Cuisine", :foreign_key => "cuisine_id")
end
