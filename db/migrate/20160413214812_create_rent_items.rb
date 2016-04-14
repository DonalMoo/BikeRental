class CreateRentItems < ActiveRecord::Migration
  def change
    create_table :rent_items do |t|
      t.belongs_to :bike, index: true, foreign_key: true
      t.belongs_to :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
