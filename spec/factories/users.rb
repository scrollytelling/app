FactoryGirl.define do
  factory :admin, class: "User" do
    account
    
    role        'admin'
    email       'admin@example.com'
    first_name  'Admin'
    last_name   'User'
    password    "9tzRFz9TS9eH"
  end
end
