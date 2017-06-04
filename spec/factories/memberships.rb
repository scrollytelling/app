FactoryGirl.define do
  # We prefix all factories with scrolly_, otherwise we clash with the Pageflow factories.
  factory :scrolly_membership, class: "Pageflow::Membership" do
    association :user, factory: :scrolly_admin
    association :entity, factory: :scrolly_account
    role 'member'
  end
end
