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
    
    #
    # There is currently an error in the new method. Only admin can perform new...
    # This is likely due to me messing up permissions.
    #
    
    user ||= User.new # guest user (not logged in)
    if user.is_admin?
      can :manage, :all
    else
      can :manage, Publication do |publication|
        publication.try(:owner) == user
      end
      can :manage, Section do |section|
        section.publication.try(:owner) == user
      end
      can :manage, Issue do |issue|
        issue.publication.try(:owner) == user
      end
      can :manage, Post do |post|
        post.publication.try(:owner) == user
      end
      can :manage, SitePage do |page|
        page.publication.try(:owner) == user
      end
      can :manage, Arrangement do |arrangement|
        arrangement.publication.try(:owner) == user
      end
      can :manage, Article do |article|
        arrangement.publication.try(:owner) == user
        #article.try(:editors).include?(user) || article.try(:contributor).include?(user)
      end
      can :manage, Author do |author|
        author.publication.try(:owner) == user
      end
      can :read, :none
    end
  end
end
