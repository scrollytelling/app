Pageflow::Account.where(name: "Scrollytelling demo").destroy_all
User.where(email: "demo@scrollytelling.io").destroy_all

include Pageflow::Seeds

default_user_password('helloworld')

account(name: 'Scrollytelling demo') do |account|
  entry = sample_entry(account: account, title: 'Voorbeeldverhaal')

  user(account: account,
       role: 'account_manager',
       email: 'demo@scrollytelling.io',
       first_name: 'Scrollytelling',
       last_name: 'Demo')
end
