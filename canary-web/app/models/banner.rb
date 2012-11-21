class Banner < ActiveRecord::Base
  attr_accessible :title, :desc, :stats, :link, :link_text, :start_date, :stop_date, :photo
  attr_accessor :photo
  
  has_one :attachment, :as => :attachmentable
  
  validates :title, :desc, :link, :link_text, :photo, :presence => true
  
  acts_as_list
  
  def self.all_public
    where("start_date <= :day AND stop_date >= :day", {:day => Date.today})
  end


end
