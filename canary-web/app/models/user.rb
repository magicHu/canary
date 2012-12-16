class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, 
         :authentication_keys => [:login], :omniauth_providers => [:github]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :email, :phone, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  # Virtual attribute for authenticating by either phone or email
  attr_accessor :login
  validates :phone, presence: true, length: { is: 11 }

  # many-to-many roles
  has_and_belongs_to_many :roles
  has_many :orders
  has_many :authentications

  # example ---> has_role? :admin
  def has_role?(role_name_sym)
    roles.any? { |role| role.name.underscore_to_sym == role_name_sym }
  end

  class << self
    # override devise method: find_first_by_auth_conditions for login can user phone or email
    def find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(phone) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end
    
  end
end
