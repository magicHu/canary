class Banner < ActiveRecord::Base
  attr_accessible :title, :desc, :stats, :link, :link_text, :start_date, :stop_date, :photo
  attr_accessor :photo
  
  has_one :attachment, :as => :attachmentable
  
  validates :title, :desc, :link, :link_text, :photo, :presence => true
  
  acts_as_list
  default_scope :order => 'position'
  
  def self.all_onshelf
    where("state = 'onshelf'")
  end

  def self.all_offshelf
    where("state = 'offshelf'")
  end

  include AASM
  aasm :column => 'state' do
    state :offshelf, :initial => true
    state :onshelf

    event :onshelf do
      transitions :from => :offshelf, :to => :onshelf
    end

    event :offshelf do
      transitions :from => :onshelf, :to => :offshelf
    end
  end
end
