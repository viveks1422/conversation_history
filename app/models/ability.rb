# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    can [:edit, :delete], Project, :user_id=>user.id
  end
end
