class RoomResource < ActiveRecord::Base
  attr_accessible :day, :order, :price, :room_id, :total
end
