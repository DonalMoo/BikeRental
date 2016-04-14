class Order < ActiveRecord::Base
  belongs_to :profile
  has_many :rent_items
end
