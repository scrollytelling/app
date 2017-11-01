require 'selenium-webdriver'
require 'browserstack/local'

Capybara.register_driver :browserstack do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.new({
    'browserstack.local' => 'true',
    'browserstack.localIdentifier' => ENV['BROWSERSTACK_LOCAL_IDENTIFIER'],
    'os' => ENV['BS_AUTOMATE_OS'],
    'os_version' => ENV['BS_AUTOMATE_OS_VERSION'],
    'browser' => ENV['SELENIUM_BROWSER'],
    'browser_version' => ENV['SELENIUM_VERSION'],
    'browserstack.debug' => "true",
    'project' => ENV['BS_AUTOMATE_PROJECT'] if ENV['BS_AUTOMATE_PROJECT'],
    'build' => ENV['BS_AUTOMATE_BUILD'] if ENV['BS_AUTOMATE_BUILD']
  })

  # Start browserstack local right here, so we can tear it down at exit.
  bs_local = BrowserStack::Local.new
  bs_local.start(key: ENV['BROWSERSTACK_ACCESS_KEY'])

  Capybara::Selenium::Driver.new app,
    browser: :remote,
    url: "http://joostbaaij1:#{ENV['BROWSERSTACK_ACCESS_KEY']}@hub-cloud.browserstack.com/wd/hub",
    desired_capabilities: capabilities
end

Capybara.run_server = false

# Stop browserstack local at the end of the run.
at_exit do
  bs_local.stop if bs_local
end
