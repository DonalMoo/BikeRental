class Bike < ActiveRecord::Base
	has_many :rent_items

	def self.search(search_for)
		Bike.where("description = ?", search_for)
	end
end
