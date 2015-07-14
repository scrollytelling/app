When(/^I give it the title "(.*?)"$/) do |title|
  fill_in "Title", with: title
  click_on "Create Story"
end

Then(/^the story is created$/) do
  expect(page).to have_content("Story was successfully created")
end
