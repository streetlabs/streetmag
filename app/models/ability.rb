class Ability
  include CanCan::Ability

  def initialize(user, publication)
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
    
    #
    #
    # The current issue now is that if a user has multiple roles, across publications they are not properly reflected!!!
    # 
    # 
    # 
    
    user ||= User.new # guest user (not logged in)
    role = user.role(publication)
    if user.is_admin?
      can :manage, :all
    elsif publication != nil && role != nil
      if role.name == "Owner"
        can :manage, [Publication, Section, Issue ,Post, SitePage, Arrangement , Article , Author ]
      elsif role.name == "Editor"
        can :read, [Publication, Section, Issue ,Post, SitePage, Arrangement , Author ]
        can :manage, Article
      else
        can :read, :none
        can :manage, Article  do |article|
          article.try(:user_id) ==  user.id
        end
      end
    else
      can :read, :none
    end
  end
  
end
