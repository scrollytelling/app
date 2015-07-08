include Pageflow::Seeds

# Make sure to change the password if you intend to apply this seed to
# a production system.
default_user_password('9tzRFz9TS9eH')

account(name: 'Pageflow') do |account|
  entry = sample_entry(account: account, title: 'Example Entry')

  user(account: account,
       role: 'admin',
       email: 'admin@example.com',
       first_name: 'Admin',
       last_name: 'User')

  user(account: account,
       role: 'account_manager',
       email: 'account_manager@example.com',
       first_name: 'Account',
       last_name: 'Manager')

  user(account: account,
       role: 'editor',
       email: 'editor@example.com',
       first_name: 'Editor',
       last_name: 'Editor') do |editor|
         membership(user: editor, entry: entry)
       end
end
