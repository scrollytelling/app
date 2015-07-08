Then(/^I see a dashboard$/) do
  expect(page).to have_content("Dashboard")
end
