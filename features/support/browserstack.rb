require 'selenium-webdriver'

Capybara.register_driver :browserstack do |app|
  options = {}
  options['project'] = ENV['BS_AUTOMATE_PROJECT'] if ENV['BS_AUTOMATE_PROJECT']
  options['build'] = ENV['BS_AUTOMATE_BUILD'] if ENV['BS_AUTOMATE_BUILD']
  options['browserstack.local'] = 'true'
  options['browserstack.localIdentifier'] = ENV['BROWSERSTACK_LOCAL_IDENTIFIER']
  options['os'] = ENV['BS_AUTOMATE_OS']
  options['os_version'] = ENV['BS_AUTOMATE_OS_VERSION']
  options['browser'] = ENV['SELENIUM_BROWSER']
  options['browser_version'] = ENV['SELENIUM_VERSION']
  options['browserstack.debug'] = 'true'

  Capybara::Selenium::Driver.new app,
    browser: :remote,
    url: "http://joostbaaij1:#{ENV['BROWSERSTACK_ACCESS_KEY']}@hub-cloud.browserstack.com/wd/hub",
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.new(options)
end
