class RentItem < ActiveRecord::Base
  belongs_to :bike
  belongs_to :order
end
