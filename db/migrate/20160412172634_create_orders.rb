class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :bike
      t.integer :price
      t.integer :days
      t.integer :total
      t.integer :bike_id
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
