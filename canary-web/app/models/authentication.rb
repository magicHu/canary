class Authentication < ActiveRecord::Base
  belongs_to :user
  attr_accessible :provider, :uid

  validates :uid, :uniqueness => { :scope => 'provider' }
end
