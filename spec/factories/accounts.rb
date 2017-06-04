FactoryGirl.define do
  factory :scrolly_account, class: "Pageflow::Account" do
    name 'Scrollytelling'

    after(:build) do |account|
      account.default_theming ||= build(:scrolly_theming, account: account)
    end
  end
end
