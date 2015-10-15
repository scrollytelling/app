class Ability
  include CanCan::Ability
  include Pageflow::AbilityMixin

  def initialize(user)
    # Setup abilities for Pageflow models
    pageflow_default_abilities(user)

    # Allow signed-in users to view the admin dashboard
    can :read, ActiveAdmin::Page, :name => "Dashboard"

    # We want editors to be able to create entries.
    # but we really are waiting for the publisher role.
    # https://github.com/codevise/pageflow/issues/411
    can :create, Pageflow::Entry
  end
end
