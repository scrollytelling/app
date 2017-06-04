FactoryGirl.define do
  # We prefix all factories with scrolly_, otherwise we clash with the Pageflow factories.
  factory :scrolly_admin, class: "User" do
    admin       true
    email       'admin@example.com'
    first_name  'Admin'
    last_name   'User'
    password    "9tzRFz9TS9eH"

    after(:create) do |user|
      FactoryGirl.create(:scrolly_membership, user: user)
    end
  end
end
