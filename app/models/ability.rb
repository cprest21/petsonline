class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new # guest user (not logged in)
       #@owner = Owner.where(:user_id => current_user.id)
       if user.role == "admin" #user.admin?
         can :manage, :all
       elsif user.role == "owner" #user.owner?
         can [:create, :update, :destroy], [Advertisement], :user_id => user.id
         can :read, Advertisement
         can :read, Advertiser #Advertiser.name
         can :read, Address, :user_id => user.id #:id => @owner.address_id
         #can :read, Advertiser.lastname
         #can :read, Advertiser.address.telephone  #change all these!
         can :read, Breed
         can :read, City
         can :read, Country
         #can :read, Deworming
         can [:create, :update, :destroy], [Loss], :user_id => user.id
         can :read, Loss
         #can :read, Operation
         can [:create, :update], [Owner], :user_id => user.id
         can :read, Owner
         can [:create, :update, :destroy], [Pet], :user_id => user.id
         can :read, Pet
         can :read, Province
         can [:create, :update, :destroy], [Sale], :user_id => user.id
         can :read, Sale
         can [:create, :update, :destroy], [Treatment], :user_id => user.id
         can :read, Treatment
         can :read, Type
         can :read, User, :user_id => user.id #User.email, 
         #can :read, Vaccination_Type
         can [:create, :update, :destroy], [Veterinarian], :user_id => user.id
         can :read, Veterinarian
       elsif user.role == "advertiser" #user.advertiser?
         can [:create, :update, :destroy], [Advertisement], :user_id => user.id
         can :read, Advertisement
         can :read, Advertiser
         can [:create, :update], [Advertiser], :user_id => user.id
         can :read, City
         can :read, Country
         can :read, Province
         can :read, User, :user_id => user.id #User.email
       end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities

    # IN form put:
    # <%= if current_user.role ==  "admin" %>
    #    <input ... >
    # In each view, specify at each input or field to be displayed who has rights.

  end
end
