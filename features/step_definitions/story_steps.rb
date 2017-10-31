Given(/^a story "(.*?)"$/) do |title|
  account(name: "Story Account") do |account|
    @story = sample_entry(account: account, title: title)
  end
end

When(/^I publish the story$/) do
  click_on "Publish"
  choose "indefinitely"
  click_on "Publish"
end
