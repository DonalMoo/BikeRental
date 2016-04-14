class AddDaysToRentItems < ActiveRecord::Migration
  def change
    add_column :rent_items, :days, :integer, :default => 1 
  end
end
