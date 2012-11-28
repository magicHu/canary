class Banner < ActiveRecord::Base
  attr_accessible :title, :desc, :state, :link, :link_text, :start_date, :stop_date, :photo, :position
  attr_accessor :photo
  
  has_one :attachment, :as => :attachmentable, :dependent => :destroy
  
  validates :title, :desc, :link, :link_text, :presence => true
  validates :photo, :presence => true, :on => :create
  
  acts_as_list
  default_scope :order => 'position'
  
  class << self
    ['onshelf', 'offshelf'].each do |state|
      define_method "all_#{state}" do
        where('state' => state).includes(:attachment)
      end
    end
  end

  def init_position_to_bottom
    self[position_column] = bottom_position_in_list.to_i + 1  
    save!
  end

  include AASM
  aasm :column => 'state', :skip_validation_on_save => true do
    state :offshelf, :initial => true
    state :onshelf

    event :on_shelf, :after => :init_position_to_bottom do
      transitions :from => :offshelf, :to => :onshelf
    end

    event :off_shelf, :after => :remove_from_list do
      transitions :from => :onshelf, :to => :offshelf
    end
  end

  before_create do |banner|
    banner.position = nil
  end

end
