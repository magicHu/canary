class Order < ActiveRecord::Base
  attr_accessible :checkin, :checkout, :order_name, :order_phone, :price, :room_id, :room_num, :status, :user_id

  belongs_to :room
  belongs_to :user

  validates :checkin, :checkout, :order_name, :order_phone, :room_num, :presence => true
  delegate :desc, :to => :room, :allow_nil => true
  delegate :email,  :to => :user, :allow_nil => true, :prefix => true

end
