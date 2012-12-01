class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :room_id
      t.integer :room_num
      t.string :order_name
      t.string :order_phone
      t.integer :status
      t.integer :price
      t.date :checkin
      t.date :checkout

      t.timestamps
    end
  end
end
