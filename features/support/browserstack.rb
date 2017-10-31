require 'selenium/webdriver'

Capybara.register_driver :browserstack_driver do |app|
  caps = Selenium::WebDriver::Remote::Capabilities.new
  caps['browserstack.local'] = 'true'
  caps['browserstack.localIdentifier'] = ENV['BROWSERSTACK_LOCAL_IDENTIFIER']
  caps['os'] = ENV['BS_AUTOMATE_OS']
  caps['os_version'] = ENV['BS_AUTOMATE_OS_VERSION']
  caps['browser'] = ENV['SELENIUM_BROWSER']
  caps['browser_version'] = ENV['SELENIUM_VERSION']
  caps['browserstack.debug'] = "true"

  caps['project'] = ENV['BS_AUTOMATE_PROJECT'] if ENV['BS_AUTOMATE_PROJECT']
  caps['build'] = ENV['BS_AUTOMATE_BUILD'] if ENV['BS_AUTOMATE_BUILD']

  browser = Selenium::WebDriver.for(:remote,
    :url => "http://joostbaaij1:#{ENV['BROWSERSTACK_ACCESS_KEY']}@hub-cloud.browserstack.com/wd/hub",
    :desired_capabilities => caps)

  Before '@browserstack' do
    @browser = browser
  end

  at_exit do
    browser.quit
  end

end
