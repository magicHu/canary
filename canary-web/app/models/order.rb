class Order < ActiveRecord::Base
  attr_accessible :checkin, :checkout, :order_name, :order_phone, :price, :room_id, :room_num, :status, :user_id

  belongs_to :room
  belongs_to :user

  validates :checkin, :checkout, :order_name, :order_phone, :room_num, :presence => true
  validates :room_id, :presence => true
  delegate :desc, :to => :room, :allow_nil => true, :prefix => true 
  delegate :email,  :to => :user, :allow_nil => true, :prefix => true

  # ORDER_STATES = [unpay, payed, checked, cancel]

  # class << self
  #   ORDER_STATES.each do |status|
      
  #   end
  # end

  include AASM
  aasm column: 'status', skip_validation_on_save: true do
    state :unpay, initial: true
    state :payed
    state :checked
    state :canceled

    event :pay do
      transitions :from => :unpay, :to => :payed
    end

    event :check do
      transitions :from => :payed, :to => :checked
    end

    event :cancel do
      transitions :from => [:unpay, :payed], :to => :canceled
    end
  end

end
