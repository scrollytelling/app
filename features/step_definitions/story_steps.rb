Given(/^a story "(.*?)"$/) do |title|
  @story = Pageflow::Entry.create! title: title, theming: Pageflow::Theming.first, account: Pageflow::Account.first
end

When(/^I give it the title "(.*?)"$/) do |title|
  fill_in "Title", with: title
end
