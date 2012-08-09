class Banner < ActiveRecord::Base
  attr_accessible :desc, :is_open, :link, :link_text, :start_date, :stop_date, :title
  
  has_one :attachment, :as => :attachmentable
  
  validates :title, :desc, :link, :link_text, :start_date, :stop_date, :presence => true
  
  acts_as_list
  default_scope :order => :position
  
  def self.all_public
    where("is_open = true AND start_date <= :day AND stop_date >= :day", {:day => Date.today})
  end
end
