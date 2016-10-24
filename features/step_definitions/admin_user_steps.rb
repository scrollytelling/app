Given(/^I have logged in as administrator$/) do
  step "I visit the admin pages"
  step "I login as an administrator"
end

When(/^I login as an administrator$/) do
  fill_in "Email", with: "admin@example.com"
  fill_in "Password", with: "9tzRFz9TS9eH"
  click_on "Login"
end
