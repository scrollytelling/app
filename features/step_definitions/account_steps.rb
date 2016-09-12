Given(/^an account "(.*?)"$/) do |name|
  @account = Pageflow::Account.new name: name
  @account.build_default_theming theme_name: "scrollytelling"
  @account.save!
end
