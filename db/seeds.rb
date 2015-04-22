include Pageflow::Seeds

# Make sure to change the password if you intend to apply this seed to
# a production system.
default_user_password('9tzRFz9TS9eH')

account(name: 'Pageflow') do |account|
  entry = sample_entry(account: account, title: 'Example Entry')

  user(account: account,
       role: 'admin',
       email: 'beekmans.inge@gmail.com',
       first_name: 'Inge',
       last_name: 'Beekmans')

  user(account: account,
       role: 'account_manager',
       email: 'martijnvantol@gmail.com',
       first_name: 'Martijn',
       last_name: 'van Tol')

  user(account: account,
       email: 'joost@spacebabies.nl',
       role: 'editor',
       first_name: 'Joost',
       last_name: 'Baaij') do |editor|

    membership(user: editor, entry: entry)
  end
end
