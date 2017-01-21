Given(/^a story "(.*?)"$/) do |title|
  @story = Pageflow::Entry.create! title: title, theming: Pageflow::Theming.first, account: Pageflow::Account.first
end

When(/^I publish the story$/) do
  click_on "Publish"
  choose "indefinitely"
  click_on "Publish"
end
