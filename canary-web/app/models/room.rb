class Room < ActiveRecord::Base
  attr_accessible :address, :desc, :name, :price, :total

  has_many :attachments, :as => :attachmentable
  has_many :orders
  
  validates :address, :desc, :name, :price, :total, :presence => true
  validates_numericality_of :price, :total, :message => "is not a number"

end
