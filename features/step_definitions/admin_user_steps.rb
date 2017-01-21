Given(/^I have logged in as administrator$/) do
  step "I visit the admin pages"
  step "I login as an administrator"
end

When(/^I login as an administrator$/) do
  @user = FactoryGirl.create :admin

  fill_in "user_email", with: "admin@example.com"
  fill_in "user_password", with: "9tzRFz9TS9eH"
  page.find('input[name="commit"]').click
end
