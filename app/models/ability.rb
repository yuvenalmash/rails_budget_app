class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    return unless user.persisted?

    can :manage, User, id: user.id
    can :manage, Expense, author_id: user.id
  end
end
