class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, 
         :authentication_keys => [:login], :omniauth_providers => [:github]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :email, :phone, :password, :password_confirmation, :remember_me

  # Virtual attribute for authenticating by either phone or email
  attr_accessor :login
  validates :email, presence: true
  #validates :phone, presence: true, length: { is: 11 }

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
    
    def find_for_auth(auth, signed_in_resource=nil)
      authentication = Authentication.where(:provider => auth.provider, :uid => auth.uid).first
      user = authentication.user if authentication
      unless user
        user ||= User.find_by_email(auth.info.email)

        unless user
          user = User.new(email:auth.info.email,
                              password:Devise.friendly_token[0,20])
        end

        # link authentication to user
        unless authentication
          user.authentications.build(:provider => auth.provider, :uid => auth.uid)
        end
        user.save
      end
      user
    end

    # Devise RegistrationsController by default calls "User.new_with_session" before building a resource
    def self.new_with_session(params, session)
      super.tap do |user|
        if auth = session["devise.auth"]
          user.email = auth.info.email if user.email.blank?
          user.authentications.build(:provider => auth.provider, :uid => auth.uid)
        end
      end
    end
  end
end
