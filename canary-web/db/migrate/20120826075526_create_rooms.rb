class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :address
      t.text :desc
      t.integer :total
      t.integer :price

      t.timestamps
    end
  end
end
