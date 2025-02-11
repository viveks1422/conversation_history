# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :user
        can :read, :all
        can [ :new, :create ], Project
        can [ :edit, :delete, :update ], Project, user_id: user.id
        can [ :new, :create ], Comment
    end
  end
end
