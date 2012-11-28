class Room < ActiveRecord::Base
  attr_accessible :address, :desc, :name, :price, :total

  has_many :orders  
  has_many :attachments, :as => :attachmentable, :dependent => :destroy

  validates :address, :desc, :name, :price, :total, :presence => true
  validates_numericality_of :price, :total, :message => "is not a number"

end
