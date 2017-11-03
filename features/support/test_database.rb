World(Pageflow::Seeds)

Before do
  default_user_password "9tzRFz9TS9eH"

  account(name: 'Scrollytelling') do |account|
    user(email: 'admin@example.com',
         first_name: 'Admin',
         last_name: 'User',
         admin: true)
  end
end
