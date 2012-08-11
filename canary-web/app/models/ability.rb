class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
    
    user ||= User.new
    
    if user.has_role? :user
      user_ability
    elsif user.has_role? :admin
      admin_ability
    elsif user.has_role? :super_admin
      super_admin_ability
    else
      guest_ability
    end
    
  end
  
  #+++++++++++++++++++++++++++++define all roles ability++++++++++++++++++++++
  def guest_ability
    
  end
  
  # user ability
  def user_ability
    
  end
  
  # admin ability
  def admin_ability
    user_ability
    
    can :manage, [Banner, Attachment]
  end
  
  # super_admin ability
  def super_admin_ability
    admin_ability
    
    can :manage, :all
  end
  
end
