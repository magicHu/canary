class Room < ActiveRecord::Base
  attr_accessible :address, :desc, :name, :price, :total, :attachments_attributes

  validates :address, :desc, :name, :price, :total, :presence => true
  validates_numericality_of :price, :total, :message => "is not a number"

  # attachment
  has_many :attachments, :as => :attachmentable, :dependent => :destroy
  accepts_nested_attributes_for :attachments, :allow_destroy => true
  default_scope includes(:attachments)

  # orders
  has_many :orders  

  # comment
  acts_as_commentable
    
end
