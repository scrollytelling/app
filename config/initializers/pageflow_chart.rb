Pageflow::Chart.configure do |config|
  # We have to use a proxy to circumvent the same-origin policy.
  config.scraped_sites_root_url = '/datawrapper'

  # Allow scraping charts from custom account URLs.
  # URLs for regular datawrapper charts are already supported.
  # config.supported_hosts << 'https://charts.example.com'

  # Uncomment to inject custom css into iframe.
  # config.use_custom_theme = true
end
