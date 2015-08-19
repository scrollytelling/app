When(/^I give it the name "(.*?)"$/) do |name|
  fill_in "Name", with: name
end

When(/^I give it the title "(.*?)"$/) do |title|
  fill_in "Title", with: title
end
