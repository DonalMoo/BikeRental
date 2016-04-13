class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string :description
      t.integer :price
      t.integer :days
      t.string :image_url

      t.timestamps null: false
    end
  end
end
