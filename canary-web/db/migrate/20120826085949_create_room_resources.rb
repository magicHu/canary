class CreateRoomResources < ActiveRecord::Migration
  def change
    create_table :room_resources do |t|
      t.integer :room_id
      t.date :day
      t.integer :total
      t.integer :price
      t.integer :order

      t.timestamps
    end
  end
end
