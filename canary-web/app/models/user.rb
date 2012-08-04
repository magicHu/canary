class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :email, :phone, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  # Virtual attribute for authenticating by either phone or email
  attr_accessor :login

  validates :phone, presence: true, length: { is: 11 }
 
  # override devise method: find_first_by_auth_conditions for login can user phone or email
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(phone) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
