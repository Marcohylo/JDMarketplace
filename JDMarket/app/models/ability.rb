class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
        can :edit, :all
        can :destroy, :all 
        can :access, :all
        can :read, :all
      else
        can :edit, Listing do |listing|
          listing.user == user
        end 
        can :destroy, Listing do |listing|
          listing.user == user 
        end 
        can :create, Listing 
        can :read, :all
      end
    
  end
end
