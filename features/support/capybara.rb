require 'capybara'

Capybara.javascript_driver = :headless_chrome

Around('@browserstack') do |scenario, block|
  original_driver = Capybara.javascript_driver

  Capybara.javascript_driver = :browserstack
  block.call
  Capybara.javascript_driver = original_driver
end
