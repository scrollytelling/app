Given(/^a story "(.*?)"$/) do |title|
  @story = Pageflow::Entry.create! title: title, theming: Pageflow::Theming.first, account: Pageflow::Account.first
end
