class Room < ActiveRecord::Base
  attr_accessible :address, :desc, :name, :price, :total

<<<<<<< HEAD
  has_many :attachments, :as => :attachmentable
  has_many :orders
  
=======
  has_many :attachments, :as => :attachmentable, :dependent => :destroy

>>>>>>> e633bc026c2bc26fe341a00c272702f0801406a2
  validates :address, :desc, :name, :price, :total, :presence => true
  validates_numericality_of :price, :total, :message => "is not a number"

end
