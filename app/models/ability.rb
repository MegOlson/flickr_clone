class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.admin?
        can :access, :rails_admin       # only allow admin users to access Rails Admin
        can :dashboard
        can :manage, :all
      end
    else
      can :read, :all                   # allow everyone to read everything
    end
  end
end
