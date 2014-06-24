class Ability
  include CanCan::Ability

  def initialize(user)
    if user.professor?
        can :manage, Subject
    else
        can :read, Subject
    end
  end
end
