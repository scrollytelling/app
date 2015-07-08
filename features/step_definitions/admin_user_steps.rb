When(/^I login as an administrator$/) do
  fill_in "Email address", with: "admin@example.com"
  fill_in "Password", with: "9tzRFz9TS9eH"
  click_on "Login"
end
