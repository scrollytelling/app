Given(/^an account "(.*?)"$/) do |name|
  @account = Pageflow::Account.create! name: name, default_theming: Pageflow::Theming.first
end
