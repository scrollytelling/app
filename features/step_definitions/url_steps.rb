When(/^I visit the admin pages$/) do
  visit "/admin"
end

When("I visit the story using many different browsers") do
  visit @story.slug
end
