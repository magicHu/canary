class Banner < ActiveRecord::Base
  attr_accessible :title, :desc, :state, :link, :link_text, :position, :attach, :attachment_attributes
  
  has_one :attachment, :as => :attachmentable, :dependent => :destroy
  accepts_nested_attributes_for :attachment, :allow_destroy => true
  
  validates :title, :desc, :link, :link_text, :presence => true
  
  acts_as_list
  default_scope order('position').includes(:attachment)

  delegate :attach, :to => :attachment, :allow_nil => true
  
  class << self
    ['onshelf', 'offshelf'].each do |state|
      define_method "all_#{state}" do
        where('state' => state)
      end
    end
  end

  def init_position_to_bottom
    add_to_list_bottom 
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
