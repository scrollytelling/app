FactoryGirl.define do
  factory :scrolly_theming, class: "Pageflow::Theming" do
    account
    theme_name 'default'
  end
end
